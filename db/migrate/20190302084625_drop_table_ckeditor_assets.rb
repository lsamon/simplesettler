class DropTableCkeditorAssets < ActiveRecord::Migration[5.1]
  def change
    drop_table :ckeditor_assets if table_exists?(:ckeditor_assets)
  end
end
