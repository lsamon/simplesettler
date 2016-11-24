class AddSloganToCities < ActiveRecord::Migration
  def change
    add_column :cities, :slogan, :string
  end
end
