class AddArticleSourceDefaultToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :article_source, :integer, default: 0
  end
end
