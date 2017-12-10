class AddArticlesCountToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :articles_count, :integer
  end
end
