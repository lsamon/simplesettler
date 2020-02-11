# frozen_string_literal: true

return unless Rails.env.production?

Gibbon::Request.api_key = ENV['MAILCHIMP_API_KEY']
Gibbon::Request.timeout = 30
Gibbon::Request.throws_exceptions = true
