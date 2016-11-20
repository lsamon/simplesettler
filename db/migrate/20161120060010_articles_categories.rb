class ArticlesCategories < ActiveRecord::Migration
  def change
    create_table :articles_categories do |t|
      t.integer :article_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
