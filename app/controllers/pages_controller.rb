class PagesController < ApplicationController
  def index
    @cities = City.all
    @articles = Article.all
  end

  def help
  end

  def inspiration
  end

  def how_it_works
  end

  def privacy
  end


end
