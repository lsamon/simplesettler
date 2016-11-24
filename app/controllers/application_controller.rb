class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :fetch_user

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:username, :email)
      end
    end
    # def fetch_user
    #   if session[:user_id].present?
    #     @current_user = User.find_by :id => session[:user_id]
    #   end
    #   session[:user_id] = nil unless @current_user.present?
    # end
    #
    # def check_for_user
    #   redirect_to root_path unless @current_user.present?
    # end
    #
    def check_for_admin
      redirect_to root_path unless (current_user.present? && current_user.admin?)
    end
end
