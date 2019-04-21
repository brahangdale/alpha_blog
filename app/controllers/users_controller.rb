class UsersController < ApplicationController
	before_action :require_user, :set_user, only: [:edit, :update, :show]
  before_action :required_same_user, only: [:edit, :update, :destroy]
	before_action :require_admin, only: [:destroy]
	def index
		@users = User.paginate(page: params[:page], per_page: 5)
	end

	def new
		@user = User.new
	end	

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success]="user successfully created"
		redirect_to  user_path(@user)  #articles_path
	else
		render 'new'
	end
end


def edit
	if @user.user_profile.blank?
		# @user.user_profile = UserProfile.new
		@user.build_user_profile
	end
end


def update
	binding.pry
	if @user.update_attributes(user_params)

		flash[:success] = "Your account was updated successfully"

		redirect_to articles_path

	else

		render 'edit'

	end

end

def show
	
	@user_articles = @user.articles.paginate(page: params[:page], per_page: 5)

end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	flash[:danger] = "user and all article have been deleted"
	redirect_to users_path
end


def set_user
@user = User.find(params[:id])
end

def required_same_user
	if current_user != @user and !current_user.admin?
		flash[:danger] = "you can edit only own account"
		redirect_to root_path
  end
end

def require_admin
	if logged_in? and !current_user.admin?
		flash[:danger] = "only admin user can perform this action"
		redirect_to  root_pathend
	end
end
private

def user_params
	params.require(:user).permit(:username, :email, :password, user_profile_attributes: [:dob, :phone_number, :country])
end 
end































