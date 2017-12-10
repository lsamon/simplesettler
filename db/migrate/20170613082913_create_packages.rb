class CreatePackages < ActiveRecord::Migration[5.1][5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :status, default: 0
    end
  end
end
