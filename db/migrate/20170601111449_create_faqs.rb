class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|

      t.timestamps null: false
      t.string :title
      t.text :content
    end
  end
end
