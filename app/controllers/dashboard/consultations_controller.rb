class Dashboard::ConsultationsController < ApplicationController
  layout 'shared/dashboard'
  before_action :user_logged_in, :find_or_initialize_appointment, :find_or_initialize_user_detail, :defaults

  def index
    session.delete(:selected_package)
  end

  def create
    #default package is consultation package
    session[:selected_package] = @package_detail.id
    current_user.save!
    if @user_detail.save && @appointment.save
      redirect_to new_dashboard_payment_path
    else
      render :index
    end
  end

  def update
    if @user_detail.update_attributes(user_params) && @appointment.update_attributes(appointment_params)
      redirect_to new_dashboard_payment_path
    else
      render :index
    end
  end


  private
  def find_or_initialize_appointment
    @appointment = current_user.appointment.nil? ? current_user.create_appointment(appointment_params) : current_user.appointment
  end

  def find_or_initialize_user_detail
    @user_detail = current_user.user_detail.nil? ? current_user.create_user_detail(user_params) : current_user.user_detail
  end

  def filter_params
    params.except(:controller, :action, :NEXT).permit(:utf8, :_method, :authenticity_token, :visa_help_type,:visa_status,:user_detail,
                                               :is_currently_in_desired_country,:done_ielts,:visa_expiry_date, :appointment_type, :resume,
                                               :appointment_date,:require_translator,:language, :country_id )
  end

  def user_params
    params.fetch(:user_detail, {}).permit(:visa_status,:visa_help_type, :is_currently_in_desired_country,:done_ielts,:visa_expiry_date, :resume, :country_id)
  end

  def appointment_params
    params.fetch(:appointment, {}).permit(:appointment_date,:require_translator, :language, :appointment_type)
  end

  def defaults
    @visa_types = VisaType.order(:name)
    @package_detail = Package.first
  end

end
