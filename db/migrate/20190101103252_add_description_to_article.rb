class AddDescriptionToArticle < ActiveRecord::Migration[5.1]
  def change
add_column :articles, :description, :text
add_column :articles, :article_no,  :integer


  end
end
