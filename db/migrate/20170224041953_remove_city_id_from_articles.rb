class RemoveCityIdFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :city_id, :integer
  end
end
