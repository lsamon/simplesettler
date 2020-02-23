module Admin::NavigationHelper
  def side_menu(controller, icon)
    title = controller.titleize
    content_tag :li, title,  class: "nav-item #{controller_name == controller ? 'active' : 'test'}" do
      link_to("/admin/#{controller}") do
        concat content_tag :i, '', class: "fa #{icon}", 'aria-hidden': 'true'
        concat content_tag :span, controller.titleize, class: 'hidden-xs hidden-sm'
      end
    end
  end
end
