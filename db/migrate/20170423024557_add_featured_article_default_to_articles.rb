class AddFeaturedArticleDefaultToArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :featured_article, :boolean, default: false
  end
end
