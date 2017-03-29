class Admin::BaseController < SharedController

  layout 'admin'
  before_action :check_admin

  include Tableize

  private

  def check_admin
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

end
