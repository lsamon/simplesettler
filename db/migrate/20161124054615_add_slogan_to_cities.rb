class AddSloganToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :slogan, :string
  end
end
