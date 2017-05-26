class RemoveArticleSourceFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :article_source
  end
end
