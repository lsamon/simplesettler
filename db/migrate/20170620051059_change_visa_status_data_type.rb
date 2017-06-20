class ChangeVisaStatusDataType < ActiveRecord::Migration[5.1]
  def change
    change_column :user_details, :visa_status, 'integer USING CAST(visa_status AS integer)'
  end
end
