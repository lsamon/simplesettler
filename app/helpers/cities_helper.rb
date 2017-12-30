module CitiesHelper
  def set_icon(category)
    case category
    when 'getting-started' then 'fa-key'
    when 'things-to-do' then 'fa-list-alt'
    when 'getting-settled' then 'fa-building-o'
    else
    end
  end

  def set_css_category_id(category)
    case category
    when 'getting-started' then 'get-started'
    when 'things-to-do' then 'to-dos'
    when 'getting-settled' then 'get-settled'
    when 'information' then 'info'
    else
    end
  end

  def default_category?(category)
    category == 'getting-started'
  end
end
