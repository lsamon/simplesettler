class AddArticlesCountToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :articles_count, :integer
  end
end
