class RemoveColumnsFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :featured_image_file_name, :string
    remove_column :articles, :featured_image_content_type, :string
    remove_column :articles, :featured_image_updated_at, :datetime
    remove_column :articles, :featured_image_file_size, :integer
  end
end
