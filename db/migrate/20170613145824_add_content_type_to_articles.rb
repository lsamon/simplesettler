class AddContentTypeToArticles < ActiveRecord::Migration[5.1][5.1]
  def change
    add_column :articles, :content_type, :integer, default: 0
  end
end
