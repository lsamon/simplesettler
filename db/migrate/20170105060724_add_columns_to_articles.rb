class AddColumnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :meta_title, :string
    add_column :articles, :meta_description, :text
    add_column :articles, :meta_keywords, :text
  end
end
