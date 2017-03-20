class CategoriesController < ApplicationController
  before_action :find_or_initialize_category, except: [:show]
  before_action :check_for_admin, only: [:edit, :create, :new, :destroy, :update]

  def index
    @categories = Category.all
  end

  def show
    if params[:id] && params[:id] == "All"
      @articles = current_city.articles.published
    else
      @articles = current_city.articles.published.includes(:category).joins(:category).where('categories.slug = ?', params[:id])
    end
    respond_to do |format|
      format.js
    end
  end

  def new
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    category = set_category
    category.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def find_or_initialize_category
    @category = params[:id] ? Category.find(params[:id]) : Category.new
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
