class ChangeDataTypeOfUserIdInUserDetails < ActiveRecord::Migration
  def up
    change_column :user_details, :user_id, :integer
  end
end
