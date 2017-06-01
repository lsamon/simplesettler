class PaymentsController < ApplicationController
  # before_action :set_payment, only: [:show, :edit, :update, :destroy]

  layout 'shared/dashboard'
  require "stripe"
  Stripe.api_key = "sk_test_w6KZabp9k6eoXNiJPqGXfo6O"

  def new
    @current_step=4
    @package_detail = Package.find_by(id: session[:selected_package])
    if @package_detail.nil?
      ap @params
      flash[:error]="The selected package doesn't exist"
      return redirect_to request.referer
    end
  end

  def create
    if session[:selected_package]
      package_detail = Package.find(session[:selected_package])

      if package_detail
        begin
          stripe_response = Stripe::Charge.create({
                                                      :amount => (package_detail.price * 100).to_i,
                                                      :currency => "aud",
                                                      :source => params[:token][:id], # obtained with Stripe.js
                                                      :description => "Charge for #{current_user.email} package: #{package_detail.name}"
                                                  }, {
                                                      # :idempotency_key => "sFRxUw43R8kvJyjI"
                                                  })

        rescue Stripe::CardError => e

          body = e.json_body
          error = body[:error]

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

        ap "after stripe charge"


        if defined? stripe_response && stripe_response[:id]
          if current_user.payment.nil?
            current_user.create_payment({:stripe_charge_id => stripe_response[:id], :amount_paid => package_detail.price.to_f, :package_id => package_detail.id})
          else
            current_user.payment.update_attributes({:stripe_charge_id => stripe_response[:id], :amount_paid => package_detail.price.to_f, :package_id => package_detail.id})
          end

          #send email
          UserMailer.payment_success_email(current_user, package_detail).deliver_later
          # admin_email = User.get_admin.email
          UserMailer.email_to_admin(current_user, package_detail).deliver_later

        else
          puts error
        end

      else
        error = "Invalid package selected"
      end
    else
      error = "Invalid request"
    end


    ap "stripe response ---"
    ap stripe_response
    ap error

    if error
      ap "error aayo "
    end
    respond_to do |format|
      if error && !error.nil?
        ap "inside error block"
        format.html { redirect_to payments_error_path, notice: error, status: 400 }
        format.js { render json: {status: "error", message: error} }
        # render json: {status: "error", message: error }  }
        session[:payment_status]="error"
      else
        ap "inside success block---"
        session[:payment_status]="success"
        session.delete(:selected_package)
        format.js {
          render json: {status: "success", window_location:payments_success_path,  message: "Payment was successful."} }
        format.html { redirect_to payments_success_path, notice: 'Payment was successful.', status: :success }
      end
    end
  end

  def payment_error
    render "payment_error", :layout => "shared/dashboard"
  end

  def payment_success
    if session[:payment_status] && !session[:payment_status].nil?
      session.delete(:payment_status)
      render "payment_success"
    else
      redirect_to root_url

    end
  end

end
