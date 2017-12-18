class AddFeaturedArticleToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :featured_article, :boolean
  end
end
