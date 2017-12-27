class CitiesController < ApplicationController
  before_action :find_city, :setup_categories_articles, except: [:index]

  def index
    if params[:term]
      @cities = City.where('LOWER(name) LIKE ?', "#{params[:term].downcase}%")
    else
      @cities = City.all
    end

    respond_to do |format|
      format.html
      format.json { render :json => @cities.to_json }
    end
  end

  def show
  end


  private
  def find_city
    @city = City.find(params[:id]) if params[:id]
  end

  def setup_categories_articles
    @articles = @city.articles.published
    @categories = Category.order(created_at: :asc)
  end

end
