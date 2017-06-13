class RemovePackagesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :packages
  end
end
