class AddExternalUrlToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :external_url, :string
  end
end
