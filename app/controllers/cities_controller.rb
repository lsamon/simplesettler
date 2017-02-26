class CitiesController < ApplicationController
  before_action :check_for_admin, :only => [:edit, :create, :new, :destroy, :update]
  before_action :find_or_initialize_city, :except => [:index]
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
    @articles = @city.articles
    @categories = Category.all
  end

  def articles_category
    @articles = @city.articles

    chosen_category = params[:category]

    if chosen_category == 'All'
      @articles
    else
      @articles = City.articles_by_category(@city, chosen_category)
    end

    respond_to do |format|
      format.js
    end
  end

  def new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to @city
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def find_or_initialize_city
    @city = params[:id] ? City.find(params[:id]) : City.new
  end

  def city_params
    params.fetch(:city, {}).permit(:name, :country, :description, :population, :slogan)
  end
end
