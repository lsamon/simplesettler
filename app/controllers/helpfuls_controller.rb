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


    def ajax_steps
      user_detail = UserDetail.new(filter_params)
      current_user.user_detail = user_detail
      render json: ({user_object: user_detail, "status":true}), status: 201
    end

  private
  def filter_params
    params.except(:controller, :action).permit(:visa_help_type,:visa_status,:f_name,:l_name,:dob,:country_of_passport,:currently_in_aus,:passport_expiry)
  end

end
