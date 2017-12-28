class HighchartsController < ApplicationController
  def chart_data
    data = RatingCache.rateable_obj_dimensions_avg_list(current_city.id)
    respond_to do |format|
      format.json { render :json => { categories: data[0], series: data[1], colors: data[2] } }
    end
  end
end
