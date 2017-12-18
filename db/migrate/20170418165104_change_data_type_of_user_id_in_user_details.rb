class ChangeDataTypeOfUserIdInUserDetails < ActiveRecord::Migration[5.1]
  def up
    change_column :user_details, :user_id, :integer
  end
end
