class AddFeaturedArticleDefaultToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :featured_article, :boolean, default: false
  end
end
