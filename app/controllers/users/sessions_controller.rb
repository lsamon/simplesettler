module Users
  class SessionsController < Devise::SessionsController
   def new
     self.resource = resource_class.new(sign_in_params)
     store_location_for(resource, params[:redirect_to])
     super
   end

   def create
     if current_user && current_user.admin?
       redirect_to admin_root_path
     else
       super
     end
   end
  end
end
