class AddExternalUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :external_url, :string
  end
end
