#http://stackoverflow.com/questions/7166401/hook-before-all-delayed-jobs
module Delayed
  module Plugins
    class DelayedJobFailure < Plugin
      callbacks do |lifecycle|
        lifecycle.after(:failure) do |worker, job|
          Slacker.post_message "A Delayed Job failed to complete a task with the error:\n#{job.last_error.to_s[0..200]}..."
        end
      end
    end
  end
end

Delayed::Worker.plugins << Delayed::Plugins::DelayedJobFailure
