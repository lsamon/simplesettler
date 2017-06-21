class ChangeColumnDataTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :user_details, :visa_expiry_date, 'date USING CAST(visa_expiry_date AS date)'
  end
end
