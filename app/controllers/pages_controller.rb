class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:help]
  def index
    @cities = City.all
    @articles = Article.all
  end

  def help
    @visa_types = VisaType.all
  end

  def inspiration
  end

  def how_it_works
  end

  def privacy
  end


end
