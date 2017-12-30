module Admin::AddButtonHelper
  def add_button_title
    controller_name&.titleize
  end

  def add_link_location
    "/admin/#{controller_name}/new"
  end

end
