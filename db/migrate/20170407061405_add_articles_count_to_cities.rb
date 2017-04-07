class AddArticlesCountToCities < ActiveRecord::Migration
  def change
    add_column :cities, :articles_count, :integer
  end
end
