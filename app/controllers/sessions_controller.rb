class SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate!(auth_options)
    byebug
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      if !session[:return_to].blank?
        # redirect_to session[:return_to]
        session[:return_to] = nil
      else
        # respond_with resource, :location => after_sign_in_path_for(resource)
        @success = resource
        byebug
        respond_to do |format|
          format.js
        end
      end
  end

end
