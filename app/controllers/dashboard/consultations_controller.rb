class Dashboard::ConsultationsController < ApplicationController

  layout 'shared/dashboard'
  before_action :user_logged_in

  def index
    @visa_types = VisaType.all.sort_by(&:name)
    @package_detail = Package.first
    session.delete(:selected_package)
    render 'dashboard/consultations/request_consultation'
  end

  def create
    user_params = params.require(:user_detail).permit(:visa_status,:visa_help_type, :is_currently_in_desired_country,:done_ielts,:visa_expiry_date)
    appointment_params = params.require(:appointment).permit(:appointment_date,:require_translator, :language)
    if current_user.user_detail.nil?
      current_user.create_user_detail(user_params)
    else
      current_user.user_detail.update_attributes(user_params)
    end
    #default package is consultation package
    session[:selected_package]= 1
    user_appointment = current_user.appointment
    user_appointment.nil? ? current_user.create_appointment(appointment_params) : current_user.appointment.update_attributes(appointment_params)
    current_user.save!
    redirect_to new_dashboard_payment_path
  end


  private
  def filter_params
    params.except(:controller, :action, :NEXT).permit(:utf8, :_method, :authenticity_token, :visa_help_type,:visa_status,:user_detail,
                                               :is_currently_in_desired_country,:done_ielts,:visa_expiry_date,
                                               :appointment_date,:require_translator,:language )
  end

end
