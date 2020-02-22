# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :user_logged_in, only: [:profile, :edit]

    def new
      self.resource = resource_class.new(sign_in_params)
      store_location_for(resource, params[:redirect_to])
      super
    end

    def create
      redirect_to(admin_root_path) if current_user.try(:admin?)
      super
    end

    def profile
      if current_user.payment
        @package_detail = Package.find_by(id: current_user.payment.package_id)
      end
      render(layout: 'shared/dashboard')
    end

    def edit
      @user = current_user
      render(layout: 'shared/dashboard')
    end

    def update
      current_user.update_attributes(username: params.dig(:user, :username))
      redirect_to(dashboard_profile_path)
    end

    protected

    def profile_params
      params.fetch(:user_detail, {}).permit(:f_name, :l_name, :dob, :image)
    end
  end
end
