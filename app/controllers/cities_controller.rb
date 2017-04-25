class CitiesController < ApplicationController
  before_action :find_city, :except => [:index]
  autocomplete :city, :name

  def index
    @cities = City.all

    if params[:search]
      @cities = City.search(params[:search]).order("created_at DESC")
      @city = City.find_by name: params[:search]
    else
      @cities = City.all.order('created_at DESC')
    end

    if @cities.length == 1
      redirect_to @cities.first
    else
      render :index
    end
  end

  def show
    @articles = @city.articles.published
    @categories = Category.order(created_at: :asc)
  end


  private
  def find_city
    @city = City.find(params[:id]) if params[:id]
  end

end
