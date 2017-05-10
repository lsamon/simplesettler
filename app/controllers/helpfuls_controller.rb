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



    def select_visa_type
      # current_step = params[:step_number]
      user_detail = UserDetail.new(filter_params)
      current_user.user_detail = user_detail
      @visa_type= VisaType.find(params[:visa_help_type])
      # render "pages/_visa_select_form_step2", status: 201
      @step_partial_file = "visa_select_form_step2"
      render "pages/help"
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
    params.except(:controller, :action).permit(:visa_help_type,:visa_status,:f_name,:l_name,:dob,:country_of_passport,:currently_in_aus,:passport_expiry)
  end

end
