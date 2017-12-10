class AddColumnsToUserDetails < ActiveRecord::Migration[5.1][5.1]
  def change
    add_column :user_details, :country_id, :integer
    add_column :user_details, :resume, :string
  end
end
