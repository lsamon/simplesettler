class AddUserIdToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :user_id, :string
  end
end
