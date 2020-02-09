# frozen_string_literal: true

OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :facebook,
    Rails.application.secrets.facebook_app_id,
    Rails.application.secrets.facebook_app_secret,
    scope: 'manage_pages, publish_pages',
    provider_ignores_state: true
  )
end
