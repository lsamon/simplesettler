class CreateVisaTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :visa_types do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
