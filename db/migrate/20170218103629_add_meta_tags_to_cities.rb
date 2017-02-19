class AddMetaTagsToCities < ActiveRecord::Migration
  def change
    add_column :cities, :meta_title, :string
    add_column :cities, :meta_description, :text
    add_column :cities, :meta_keywords, :text
  end
end
