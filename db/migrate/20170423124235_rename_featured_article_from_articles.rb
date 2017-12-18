class RenameFeaturedArticleFromArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :featured_article, :featured
  end
end
