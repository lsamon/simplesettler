class AddDefaultsToArticles < ActiveRecord::Migration[5.1]
  def change
    change_column_default :articles, :status, default: 'draft'
  end
end
