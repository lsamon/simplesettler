class Admin::BaseController < SharedController

  layout 'admin'
  before_action :check_for_admin

  include Tableize

end
