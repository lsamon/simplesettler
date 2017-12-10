class AddArticleIndexToCityArticles < ActiveRecord::Migration[5.1]
  def change
    add_index :city_articles, :article_id
  end
end
