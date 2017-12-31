# class Dashboard::PaymentsController < ApplicationController
#   # before_action :set_payment, only: [:show, :edit, :update, :destroy]
#   layout 'shared/dashboard'
#
#   def new
#     @current_step = 4
#     @package_detail = Package.find_by(id: session[:selected_package])
#     if @package_detail.nil?
#       flash[:error]="The selected package doesn't exist"
#       return redirect_to request.referer
#     end
#   end
#
#   def create
#     if session[:selected_package]
#       package_detail = Package.find(session[:selected_package])
#       # admin_email = User.get_admin.email
#       if UserMailer.email_to_admin(User.admin, current_user, package_detail).deliver_later
#         flash[:notice] = "Request sent successfully!"
#       else
#         flash[:alert] = "Failed to send request!"
#       end
#     end
#   end
#
#   # def payment_error
#   #   render "dashboard/payments/payment_error", :layout => "shared/dashboard"
#   # end
#   #
#   # def payment_success
#   #   if session[:payment_status] && !session[:payment_status].nil?
#   #     session.delete(:payment_status)
#   #     render "dashboard/payments/payment_success"
#   #   else
#   #     redirect_to root_url
#   #
#   #   end
#   # end
#
# end
