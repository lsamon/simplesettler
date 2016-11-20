class CreateHelpfuls < ActiveRecord::Migration
  def change
    create_table :helpfuls do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :helped

      t.timestamps null: false
    end
  end
end
