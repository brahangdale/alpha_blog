class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
    	t.string :dob
    	t.string :phone_number
    	t.string :country
      t.timestamps
    end
  end
end
