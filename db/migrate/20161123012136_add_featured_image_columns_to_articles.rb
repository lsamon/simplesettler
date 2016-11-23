class AddFeaturedImageColumnsToArticles < ActiveRecord::Migration
 def up
    add_attachment :articles, :featured_image
  end

  def down
    remove_attachment :articles, :featured_image
  end
end
