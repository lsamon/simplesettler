class RemoveArticleSourceFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :article_source
  end
end
