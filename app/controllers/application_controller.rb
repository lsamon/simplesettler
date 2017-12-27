class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  helper_method :current_city, :check_for_admin

  layout :layout_by_resource

  def current_city
    session[:city_id] = params[:city_id] ? params[:city_id] : params[:id]
    @city = City.where(slug: session[:city_id]).first
  end

  def check_for_admin
    redirect_to root_path unless (current_user.present? && current_user.admin?)
  end

  def user_logged_in
    redirect_to new_user_session_path unless current_user.present?
  end

  private
  def layout_by_resource
    "user" if devise_controller?
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_out_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

end
