class CreateAdminPayments < ActiveRecord::Migration
  def change
    create_table :admin_payments do |t|

      t.timestamps null: false
    end
  end
end
