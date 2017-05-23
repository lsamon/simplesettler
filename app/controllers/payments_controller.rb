class PaymentsController < ApplicationController
  # before_action :set_payment, only: [:show, :edit, :update, :destroy]


  layout 'shared/dashboard'
  require "stripe"
  Stripe.api_key = "sk_test_wJMpt7N2G03Umq2Zvd0JgWEU"

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @current_step=4
    # @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    #start creating payment
    #get the payment price
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



    respond_to do |format|


      if defined? stripe_response && stripe_response[:id]
        current_user.payment.create_or_update({:stripe_charge_id=> stripe_response[:id], :amount_paid=> amount, :package=> params[:package_id]})

        #send email



      else
        #insert the data in the table
      end



      puts stripe_response
      # if @payment.save
      #   format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
      #   format.json { render :show, status: :created, location: @payment }
      # else
      #   format.html { render :new }
      #   format.json { render json: @payment.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.fetch(:payment, {})
    end
end
