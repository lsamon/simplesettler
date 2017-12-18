class AddColumnsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :meta_title, :string
    add_column :articles, :meta_description, :text
    add_column :articles, :meta_keywords, :text
  end
end
