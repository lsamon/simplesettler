class CategoriesController < ApplicationController
  before_action :find_category, except: [:index]

  def show
    if params[:id] && params[:id] == "All"
      @articles = current_city.articles.published
    else
      @articles = current_city.articles.published.joins(:category).where('categories.slug = ?', params[:id])
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def find_category
    @category = Category.where(slug: params[:id]).first
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
