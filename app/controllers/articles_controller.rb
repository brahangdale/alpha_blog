class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except:[:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
 
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    #binding.pry
    if @article.save
     	flash[:success]="Articles was successfully created"
      redirect_to  article_path(@article)
    else
     	render :new
    end
  end

  def show
   	
  end

  def edit
  
  end
 	
 	def update
    @article = Article.new(article_params)
    
    if @article.save
     	flash[:success]="Article was sussessfully updated"
      redirect_to article_path(@article)

    else
     	render :edit
    end
 	end
 
  def destroy
    @article.destroy
    flash[:danger]="Article was sussessfully deleted"
    redirect_to  articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
   
  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "you can only edit and delete own article"
      redirect_to root_path
    end
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
end