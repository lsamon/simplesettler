Mailgun.configure do |config|
  config.api_key = ENV['mailgun_api_key']
  # config.async = false
end
