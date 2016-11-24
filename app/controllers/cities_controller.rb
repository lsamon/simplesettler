class CitiesController < ApplicationController
  before_action :check_for_admin, :only => [:edit, :create, :new, :destroy, :update]
  
  def index
    @cities = City.all

    if params[:search]
      @cities = City.search(params[:search]).order("created_at DESC")
      @city = City.find_by :name => params[:search]
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
    @city = set_city
    @articles = @city.articles
    @categories = Category.all

    @feedbacks = Feedback.per_user_city(current_user.id, @city.id) if user_signed_in?
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

    # raise params

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
    puts "START"
    puts
    puts
    puts @city
    puts
    puts "END"
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

  def submit_rating
    city_id = params[:id]
    feedback = params[:feedback]
    rating = params[:rating]

    city_feedback = Feedback.check_exists(current_user.id, feedback, city_id)

    # binding.pry

    if city_feedback.present?
      feedback_id = city_feedback.first.id
      update_data = { feedback => rating.to_f }
      city_feedback.update(feedback_id, update_data)
      redirect_to '#'
    else
      city_feedback = Feedback.new :city_id => city_id, feedback => rating, :user_id => current_user.id
      city_feedback.save
      redirect_to '#'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find params[:id]
  end

  def city_params
    params.require(:city).permit(:name, :country, :description, :population, :slogan)
  end
end
