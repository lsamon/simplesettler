class DropDelayedWorkers < ActiveRecord::Migration[5.1][5.1]
  def change
    drop_table :delayed_workers
  end
end
