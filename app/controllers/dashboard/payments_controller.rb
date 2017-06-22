class Dashboard::PaymentsController < ApplicationController
  # before_action :set_payment, only: [:show, :edit, :update, :destroy]
  layout 'shared/dashboard'

  def new
    @current_step = 4
    @package_detail = Package.find_by(id: session[:selected_package])
    if @package_detail.nil?
      flash[:error]="The selected package doesn't exist"
      return redirect_to request.referer
    end
  end

  def create
    if session[:selected_package]
      package_detail = Package.find(session[:selected_package])
      stripe = StripeApi.new package_detail.price, 'aud', params[:token][:id], package_detail.name, current_user.email

      if stripe.error.nil?
        if defined? stripe_response && stripe_response[:id]
          if current_user.payment.nil?
            current_user.create_payment({:stripe_charge_id => stripe.response.first[:id], :amount_paid => package_detail.price.to_f, :package_id => package_detail.id})
          else
            current_user.payment.update_attributes({:stripe_charge_id => stripe.response.first[:id], :amount_paid => package_detail.price.to_f, :package_id => package_detail.id})
          end
          #send email
          UserMailer.payment_success_email(current_user, package_detail).deliver_later
          # admin_email = User.get_admin.email
          UserMailer.email_to_admin(User.admin, current_user, package_detail).deliver_later
        else
        end
      else
        error = stripe.error
      end
    else
      error = "Invalid package selected"
    end

    respond_to do |format|
      if error.present?
        format.html { redirect_to dashboard_payments_error_path, notice: error, status: 400 }
        format.js { render json: {status: "error", message: error} }
        session[:payment_status]="error"
      else
        session[:payment_status]="success"
        session.delete(:selected_package)
        format.js {
          render json: {status: "success", window_location:dashboard_payments_success_path,  message: "Payment was successful."} }
        format.html { redirect_to dashboard_payments_success_path, notice: 'Payment was successful.', status: :success }
      end
    end
  end

  def payment_error
    render "dashboard/payments/payment_error", :layout => "shared/dashboard"
  end

  def payment_success
    if session[:payment_status] && !session[:payment_status].nil?
      session.delete(:payment_status)
      render "dashboard/payments/payment_success"
    else
      redirect_to root_url

    end
  end

end
