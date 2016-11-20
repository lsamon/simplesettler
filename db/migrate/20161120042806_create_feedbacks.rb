class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :city_id
      t.integer :liveability
      t.integer :safety
      t.integer :movability
      t.integer :weather

      t.timestamps null: false
    end
  end
end
