class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = set_city
    @articles = @city.articles
    @categories = Category.all
  end

  def articles_category
    @city = set_city
    @all_articles = @city.articles

    chosen_category = params[:category]

    if chosen_category == 'All'
      @all_articles = @city.articles
    else
      category = Category.find_by :name => chosen_category
      category_articles = category.articles
      @all_articles = category_articles
    end

    respond_to do |format|
      format.html { redirect_to "#" }
      format.js
    end

  end

  def new
    @city = City.new
  end

  def edit
    @city = set_city
  end

  def update
    @city = set_city
    if @city.update(city_params)
      redirect_to @city
    else
      render :edit
    end
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    city = set_city
    city.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find_by :name => params[:name]
  end

  def city_params
    params.require(:city).permit(:name, :country, :description, :population)
  end
end
