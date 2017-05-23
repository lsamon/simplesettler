class PaymentsController < ApplicationController
  # before_action :set_payment, only: [:show, :edit, :update, :destroy]


  layout 'shared/dashboard'
  require "stripe"
  Stripe.api_key = "sk_test_wJMpt7N2G03Umq2Zvd0JgWEU"


  def new
    @current_step=4
    # @payment = Payment.new
  end

  def create
    amount=100
    begin
      stripe_response = Stripe::Charge.create({
                                                  :amount => amount,
                                                  :currency => "aud",
                                                  :source => params[:token][:id], # obtained with Stripe.js
                                                  :description => "Charge for #{current_user.email}"
                                              }, {
                                                  # :idempotency_key => "sFRxUw43R8kvJyjI"
                                              })

    rescue Stripe::CardError => e

      body = e.json_body
      error  = body[:error]

      puts "Status is: #{e.http_status}"
      puts "Type is: #{error[:type]}"
      puts "Charge ID is: #{error[:charge]}"
      # The following fields are optional

      puts "Code is: #{error[:code]}" if error[:code]
      puts "Decline code is: #{error[:decline_code]}" if error[:decline_code]
      puts "Param is: #{error[:param]}" if error[:param]
      puts "Message is: #{error[:message]}" if error[:message]
    rescue Stripe::RateLimitError => e
      error = e.message
        # Too many requests made to the API too quickly
    rescue Stripe::InvalidRequestError => e
      error = e.message
        # Invalid parameters were supplied to Stripe's API
    rescue Stripe::AuthenticationError => e
      error = e.message
        # Authentication with Stripe's API failed
        # (maybe you changed API keys recently)
    rescue Stripe::APIConnectionError => e
      error = e.message
        # Network communication with Stripe failed
    rescue Stripe::StripeError => e
      error = e.message
        # Display a very generic error to the user, and maybe send
        # yourself an email
    rescue => e
      error = e.message
      # Something else happened, completely unrelated to Stripe
    end



    # package = params[:package_id]
    package = 1

    if defined? stripe_response && stripe_response[:id]
      if current_user.payment.nil?
        current_user.create_payment({:stripe_charge_id=> stripe_response[:id], :amount_paid=> amount, :package_id=> package})
      else
        current_user.payment.update_attributes({:stripe_charge_id=> stripe_response[:id], :amount_paid=> amount, :package_id=> package})
      end

      #send email
      UserMailer.payment_success_consultation_email(current_user).deliver_later
      # admin_email = User.get_admin.email
      UserMailer.email_to_admin(current_user).deliver_later


    else
      puts error
    end

    puts stripe_response
    respond_to do |format|
      if defined? error
        format.html { redirect_to payments_error_path, notice: error , status: 400}
      else
        format.html { redirect_to payments_success_path, notice: 'Payment was successfully created.', status: :success }
      end
    end
  end

  def payment_error
    render "payment_error", :layout=>"shared/dashboard"
  end

  def payment_success
    render "payment_success"
  end

end

