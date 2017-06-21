require "stripe"

class StripeApi
  attr_accessor :amount, :currency, :response
  attr_reader :user_email, :error, :package_name, :source

  def initialize(amount, currency, source, package_name, user_email)
    Stripe.api_key = 'sk_live_tO3lKPs7J4IkU0f9VJhv6Owh'
    @amount = amount
    @currency = currency
    @source = source
    @package_name = package_name
    @user_email = user_email
    setup
  end

  def setup
    stripe_response = {}
    begin
      @response = Stripe::Charge.create({
        :amount => (@amount * 100).to_i,
        :currency => @currency,
        :source => @source, # obtained with Stripe.js
        :description => "Charge for #{@user_email} for package: #{@package_name}"
        }), {
          :idempotency_key => "vRJV1OCNqCl4lsKr"
        }

    rescue Stripe::CardError => e
      body = e.json_body
      @error = body[:error]
    rescue Stripe::RateLimitError => e
      @error = e.message
    rescue Stripe::InvalidRequestError => e
      @error = e.message
    rescue Stripe::AuthenticationError => e
      @error = e.message
    rescue Stripe::APIConnectionError => e
      @error = e.message
    rescue Stripe::StripeError => e
      @error = e.message
    rescue => e
      @error = e.message
    end

    stripe_response
  end
end
