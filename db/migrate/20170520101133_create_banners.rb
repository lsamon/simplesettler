class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.string :media
      t.string :slug

      t.timestamps null: false
    end
  end
end