class PagesController < ApplicationController
  def index
    @cities = City.all
    @articles = Article.all
  end
end
