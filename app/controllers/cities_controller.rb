# frozen_string_literal: true

# CitiesController
class CitiesController < ApplicationController
  def index
    @cities = City.all

    respond_to do |format|
      format.html
      format.json { render json: @cities.to_json }
    end
  end
end
