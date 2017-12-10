class CreateAdminPackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.decimal :price, :precision=>5, :scale=>2
      t.text :description
      t.integer :status

      t.timestamps null: false
    end
  end
end
