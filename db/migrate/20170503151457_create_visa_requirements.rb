class CreateVisaRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :visa_requirements do |t|
      t.integer :visa_type_id
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
