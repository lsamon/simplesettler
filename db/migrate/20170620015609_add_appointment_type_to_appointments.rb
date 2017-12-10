class AddAppointmentTypeToAppointments < ActiveRecord::Migration[5.1][5.1]
  def change
    add_column :appointments, :appointment_type, :integer, default: 0
  end
end
