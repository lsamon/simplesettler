class AddArticlesCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :articles_count, :integer
  end
end
