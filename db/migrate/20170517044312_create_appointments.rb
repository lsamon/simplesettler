class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :user_id
      t.string :appointment_date
      t.boolean :require_translator
      t.string :language

      t.timestamps null: false
    end
  end
end
