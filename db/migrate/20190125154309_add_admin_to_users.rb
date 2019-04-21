class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :admin, :boolean, default: false
  	remove_column :users, :admins :boolean, default: false
  end
end
