class AddArticleSourceToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :article_source, :integer
  end
end
