# frozen_string_literal: true

# In Rails, you could put this in config/initializers/koala.rb
Koala.configure do |config|
  config.app_id = ENV['FACEBOOK_APP_ID']
  config.app_secret = ENV['FACEBOOK_APP_SECRET']
  config.api_version = 'v5.0'
  config.oauth_callback_url = URI.decode_www_form_component('https://c7ab8cc3.ngrok.io/')
end
