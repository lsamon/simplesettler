class AddIndexDelayedJobs < ActiveRecord::Migration[5.1]
  def change
    add_index :delayed_jobs, [:run_at, :locked_at, :locked_by, :failed_at], :name => 'index_delayed_jobs_for_better_row_locking'
  end
end
