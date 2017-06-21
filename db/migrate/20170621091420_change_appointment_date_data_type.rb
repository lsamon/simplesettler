class ChangeAppointmentDateDataType < ActiveRecord::Migration[5.1]
  def up
    remove_column :appointments, :appointment_date, :string
    add_column :appointments, :appointment_date, :datetime
  end

  def down
    remove_column :appointments, :appointment_date, :datetime
  end
end
