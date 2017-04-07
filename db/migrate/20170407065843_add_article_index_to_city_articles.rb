class AddArticleIndexToCityArticles < ActiveRecord::Migration
  def change
    add_index :city_articles, :article_id
  end
end
