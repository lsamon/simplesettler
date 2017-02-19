class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_city

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:username, :email)
      end
    end

    def check_for_admin
      redirect_to root_path unless (current_user.present? && current_user.admin?)
    end

    def current_city
      session[:city_id] = params[:id]
      @current_city = City.find session[:city_id]
    end

end
