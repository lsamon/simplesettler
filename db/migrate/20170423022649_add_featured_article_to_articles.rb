class AddFeaturedArticleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :featured_article, :boolean
  end
end
