module Users
  class SessionsController < Devise::SessionsController
    before_action :user_logged_in, only: [:profile, :edit]

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

    def profile
      if current_user.payment
        @package_detail = Package.find_by(id: current_user.payment.package_id)
      end
      render layout: 'shared/dashboard'
    end

    def edit
      @user = current_user.user_detail ||= UserDetail.new
      puts @user.inspect
      render layout: 'shared/dashboard'
    end

    def update
      current_user.update_attributes({:username=> params[:user][:username]})
      if current_user.user_detail.nil?
        current_user.create_user_detail(profile_params)
      else
        current_user.user_detail.update_attributes(profile_params)
      end
      redirect_to dashboard_profile_path
    end

   def profile_params
     params.fetch(:user_detail, {}).permit(:f_name, :l_name, :dob, :image)
   end

  end
end
