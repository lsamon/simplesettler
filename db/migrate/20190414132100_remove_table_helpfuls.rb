class RemoveTableHelpfuls < ActiveRecord::Migration[5.1]
  def change
    drop_table :helpfuls if table_exists?(:helpfuls)
  end
end
