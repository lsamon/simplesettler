class CreateUserDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :user_details do |t|
      t.string :visa_status
      t.string :f_name
      t.string :l_name
      t.string :dob
      t.string :country_of_passport
      t.boolean :currently_in_aus
      t.string :passport_expiry

      t.timestamps null: false
    end
  end
end
