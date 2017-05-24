class AddAdditionalDetailsToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :is_currently_in_desired_country, :boolean
    add_column :user_details, :done_ielts, :boolean
    add_column :user_details, :visa_expiry_date, :string
  end
end
