# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.before(:each) do
    DatabaseCleaner.strategy =
      if example.metadata[:js]
        :truncation
      else
        example.metadata[:strategy] || :transaction
      end

    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:all) do
    DatabaseCleaner.clean
  end
end
