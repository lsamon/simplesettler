class HelpfulsController < ApplicationController

  def create
    byebug
    @response = params[:response]
    user_id = user_signed_in? ? current_user.id : nil
    @helpful = Helpful.create helped: false, user_id: user_id, article_id: params[:id]

    @helpful = Helpful.create helped: true, user_id: user_id, article_id: params[:id] if @response == 'Yes'


    respond_to do |format|
      format.js
    end
  end



  #Visa Steps methods, we'll move to custom controller later
  def select_visa_type
    # current_step = params[:step_number]
    user_detail = UserDetail.new(filter_params)
    current_user.user_detail = user_detail
    current_user.save!
    @visa_type= VisaType.find(params[:visa_help_type])
    # render "pages/_visa_select_form_step2", status: 201
    @step_partial_file = "visa_select_form_step2"
    render "pages/help"
  end


  def get_applicant_details
    #render form
    @step_partial_file = "get_applicant_details"
    render "pages/help"
  end


  def post_application_details
    user_detail = UserDetail.new(filter_params)
    current_user.user_detail = user_detail
    current_user.save!
    redirect_to "/get_additional_details", status: 301
  end


  def get_additional_details
    @step_partial_file = "get_additional_details"
    @visa_types = VisaType.all.sort_by(&:name)
    render "pages/help"
  end


  def post_additional_details
    user_detail = UserDetail.new(filter_params.slice(:visa_status,:is_currently_in_desired_country,:done_ielts,:visa_expiry_date))
    current_user.user_detail = user_detail
    # redirect_to "/get_additional_details", status: 301
    appointment = Appointment.new(filter_params.slice(:appointment_date,:require_translator, :language))
    current_user.appointments << appointment
    current_user.save!

    redirect_to "/payments"
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
    puts params
    params.except(:controller, :action).permit(:visa_help_type,:visa_status,:f_name,:l_name,:dob,:country_of_passport,:currently_in_aus,:passport_expiry,
                                               :is_currently_in_desired_country,:done_ielts,:visa_expiry_date,
    :appointment_date,:require_translator, :language )
  end

end
