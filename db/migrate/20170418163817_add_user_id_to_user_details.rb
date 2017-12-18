class AddUserIdToUserDetails < ActiveRecord::Migration[5.1]
  def up
    add_column :user_details, :user_id, :integer
    add_column :user_details, :visa_help_type, :string
  end

  def down
    remove_column :user_details, :user_id
  end
end
