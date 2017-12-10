class CreateCityArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :city_articles do |t|
      t.integer :article_id
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
