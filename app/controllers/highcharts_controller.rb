class HighchartsController < ApplicationController
  def chart_data
    data = RatingCache.rateable_obj_dimensions_avg_list(current_city.id)
    categories = data.map{ |c| c[0].titleize }
    series = data.map{ |s| s[1] }
    respond_to do |format|
      format.json { render :json => { categories: categories, series: series } }
    end
  end
end
