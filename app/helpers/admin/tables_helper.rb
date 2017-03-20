module Admin::TablesHelper

  def sort_header(column, title, options={})
    if params[:col] != column.to_s && options.key?(:dir)
      dir = options[:dir]
    else
      dir = params[:dir] == 'DESC' ? 'ASC' : 'DESC'
    end
    options.delete(:dir)
    url = params.merge(col: column, dir: dir)
    active_sort = params[:col] == column.to_s
    link_title = ( title + sort_caret(active_sort, column, dir) ).html_safe
    options[:class] ||= ''
    options[:class] += ' sorted' if active_sort
    content_tag :th, link_to( link_title, url.permit(:col, :dir, :page, :controller, :action)), options
  end

  def sort_caret(active_sort, column, dir)
    caret = dir == 'ASC' ? 'up' : 'down'
    active_sort ? content_tag(:span, '', class: "fa fa-chevron-#{caret}") : ''
  end

end
