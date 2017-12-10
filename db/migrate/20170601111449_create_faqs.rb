class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs do |t|

      t.timestamps null: false
      t.string :title
      t.text :content
    end
  end
end
