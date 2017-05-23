class DashboardController < ApplicationController

  layout 'shared/dashboard'

  def index
      @visa_types = VisaType.all
  end

  #Visa Steps methods, we'll move to custom controller later
  def select_visa_type

    if current_user.user_detail.nil?
      current_user.create_user_detail({:visa_help_type=>filter_params[:visa_help_type]})
    else
      current_user.user_detail.update_attributes({:visa_help_type=>filter_params[:visa_help_type]})
    end
    @visa_type= VisaType.find(params[:visa_help_type])
    @current_step=1
    render "dashboard/_visa_select_form_step2"
  end


  def get_applicant_details
    @current_step=2
    render "dashboard/_get_applicant_details"
  end


  def post_application_details
    user_params = params.require(:user_detail).permit(:f_name,:l_name,:dob,:currently_in_aus,:country_of_passport,:passport_expiry)
    # user_detail = UserDetail.update_attributes(user_params)
    # .slice(:f_name,:l_name,:dob,:currently_in_aus,:country_of_passport,:passport_expiry))
    current_user.user_detail.update_attributes(user_params)
    redirect_to "/dashboard/get_additional_details", status: 301
  end


  def get_additional_details
    # @step_partial_file = "get_additional_details"
    @visa_types = VisaType.all.sort_by(&:name)
    @current_step=3
    render "dashboard/_get_additional_details"
  end


  def post_additional_details

    user_params = params.require(:user_detail).permit(:visa_status,:is_currently_in_desired_country,:done_ielts,:visa_expiry_date)
    appointment_params = params.require(:appointments).permit(:appointment_date,:require_translator, :language)

    current_user.user_detail.update_attributes(user_params)

    user_appointment = current_user.appointments.last
    user_appointment.nil? ? current_user.appointments.create(appointment_params) : current_user.appointments.last.update_attributes(appointment_params)
    current_user.save!
    redirect_to "/payments/new"
    #appointment details in appointment model
  end


  def ajax_steps
    current_step = params[:step_number]
    user_detail = UserDetail.new(filter_params)
    current_user.user_detail = user_detail
    @visa_type= VisaType.find(params[:visa_help_type])
    render json: ({user_object: user_detail, "status":true, current_step: current_step.to_i}), status: 201
  end

  private
  def filter_params
    params.except(:controller, :action, :NEXT).permit(:utf8, :_method, :authenticity_token, :visa_help_type,:visa_status,:user_detail,
                                               :is_currently_in_desired_country,:done_ielts,:visa_expiry_date,
                                               :appointment_date,:require_translator,:language )
  end

end
