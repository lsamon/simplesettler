class RenameFeaturedArticleFromArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :featured_article, :featured
  end
end
