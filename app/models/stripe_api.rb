require "stripe"

class StripeApi
  attr_accessor :amount, :currency, :response
  attr_reader :user_email, :error, :package_name, :source

  def initialize(amount, currency, source, package_name, user_email)
    Stripe.api_key = ENV['STRIPE_API_KEY']
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

    # rescue Stripe::StripeError => e
    #   @error = e.message
    rescue
    end

    stripe_response
  end
end
