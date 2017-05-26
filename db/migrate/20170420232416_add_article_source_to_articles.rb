class AddArticleSourceToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_source, :integer
  end
end
