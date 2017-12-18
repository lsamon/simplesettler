class RemoveCityIdFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :city_id, :integer
  end
end
