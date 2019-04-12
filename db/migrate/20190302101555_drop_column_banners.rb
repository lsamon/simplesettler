class DropColumnBanners < ActiveRecord::Migration[5.1]
  def change
    drop_table :banners if table_exists?(:banners)
  end
end
