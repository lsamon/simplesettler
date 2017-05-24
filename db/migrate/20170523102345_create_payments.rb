class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :stripe_charge_id
      t.string :amount_paid
      t.integer :package
      t.timestamps null: false
    end
  end
end
