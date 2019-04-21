class RemoveAdminsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admins, :boolean
  end
end
