class CategoriesController < ApplicationController
  before_action :check_for_admin, :only => [:edit, :create, :new, :destroy, :update]

  def index
    @categories = Category.all
  end

  def show
    @category = set_category
  end

  def new
    @category = Category.new
  end

  def edit
    @category = set_category
  end

  def update
    @category = set_category
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
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
