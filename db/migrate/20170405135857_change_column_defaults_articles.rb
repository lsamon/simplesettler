class ChangeColumnDefaultsArticles < ActiveRecord::Migration
  def change
    change_column_default :articles, :status, default: 0
  end
end
