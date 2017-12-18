class AddMetaTagsToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :meta_title, :string
    add_column :cities, :meta_description, :text
    add_column :cities, :meta_keywords, :text
  end
end
