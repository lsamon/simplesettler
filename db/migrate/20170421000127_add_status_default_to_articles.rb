class AddStatusDefaultToArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :status, :integer, default: 0
  end
end
