module Admin::AddButtonHelper
  def add_button_title(url)
    get_title_from_url(url)&.titleize
  end

  def add_link_location(url)
    add_button_title(url) == 'Admin' ? "/admin/articles/new" : "/admin/#{get_title_from_url(url)}/new"
  end

  def get_title_from_url(url)
    url.split("/").last.split("?").first
  end
end
