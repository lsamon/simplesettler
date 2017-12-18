class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :city_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
