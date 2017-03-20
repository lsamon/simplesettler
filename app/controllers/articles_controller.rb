class ArticlesController < ApplicationController

  def show
    @article = current_city.articles.published.find(params[:id])
    @articles = current_city.articles.published.page(params[:page])
  end

end
