class ChangeColumnDefaultsArticles < ActiveRecord::Migration[5.1]
  def change
    change_column_default :articles, :status, default: 0
  end
end
