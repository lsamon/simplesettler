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

end
