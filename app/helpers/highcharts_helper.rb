module HighchartsHelper
  def chart_for(rateable_obj)
    content_tag :div, '', :class => "city-highchart","data-city-name" => rateable_obj.slug,
                "data-classname" => rateable_obj.class.name == rateable_obj.class.base_class.name ? rateable_obj.class.name : rateable_obj.class.base_class.name
  end
end
