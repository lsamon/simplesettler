class HardWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :crawler, :retry => 3, :backtrace => true
  def perform(*args)
    # Do something
  end
end
