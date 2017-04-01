class AddDefaultsToArticles < ActiveRecord::Migration
  def change
    change_column_default :articles, :status, default: 'draft'
  end
end
