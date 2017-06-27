class Dashboard::ConsultationsController < ApplicationController

  layout 'shared/dashboard'
  before_action :user_logged_in

  def index
    @visa_types = VisaType.all.sort_by(&:name)
    @selected_visa_type = params[:visa_type].to_i
    @package_detail = Package.first
    session.delete(:selected_package)
    render 'dashboard/consultations/request_consultation'
  end

  def create
    if current_user.user_detail.nil?
      current_user.create_user_detail(user_params)
    else
      current_user.user_detail.update_attributes(user_params)
    end
    #default package is consultation package
    session[:selected_package]= Package.first.id
    user_appointment = current_user.appointment
    user_appointment.nil? ? current_user.create_appointment(appointment_params) : current_user.appointment.update_attributes(appointment_params)
    current_user.save!
    redirect_to new_dashboard_payment_path
  end


  private

  def find_or_initialize_user_detail
  end

  def find_or_initialize_appointment
  end

  def filter_params
    params.except(:controller, :action, :NEXT).permit(:utf8, :_method, :authenticity_token, :visa_help_type,:visa_status,:user_detail,
                                               :is_currently_in_desired_country,:done_ielts,:visa_expiry_date, :country_id, :resume,
                                               :appointment_date,:require_translator,:language, :appointment_type, :country_of_passport )
  end

  def user_params
    params.fetch(:user_detail, {}).permit(:visa_status,:visa_help_type, :is_currently_in_desired_country,:done_ielts,:visa_expiry_date, :country_of_passport, :resume)
  end

  def appointment_params
    params[:user_detail][:appointment].permit(:appointment_date,:require_translator, :language, :appointment_type)
  end
end
