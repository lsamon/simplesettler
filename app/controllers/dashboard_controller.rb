class DashboardController < ApplicationController

  layout 'shared/dashboard'
  before_action :user_logged_in

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
    redirect_to "/dashboard/select_package", status: 301
  end

  def select_package
    @packages = Package.where({status: 1}).where.not(id: 1)
    @current_step=3
  end


  def post_select_package
    if (params[:package_id].nil?)
      flash[:warning]="No package selected"
      return redirect_to request.referer, status:300
      ap params
    end
    ap 'here'
    session[:selected_package]= params[:package_id].to_i

    redirect_to "/payments/new"
  end

  def request_consultation
    @visa_types = VisaType.all.sort_by(&:name)
    @package_detail = Package.find(1)
    session.delete(:selected_package)
  end

  def post_consulatation_request
    user_params = params.require(:user_detail).permit(:visa_status,:visa_help_type, :is_currently_in_desired_country,:done_ielts,:visa_expiry_date)
    appointment_params = params.require(:appointments).permit(:appointment_date,:require_translator, :language)
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
    redirect_to "/payments/new"

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
