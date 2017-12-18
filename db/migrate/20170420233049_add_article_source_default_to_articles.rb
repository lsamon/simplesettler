class AddArticleSourceDefaultToArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :article_source, :integer, default: 0
  end
end
