class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:help]
  layout 'pages'
  def index
    @cities = City.all
    @articles = Article.all
    @banner = Banner.first
    render layout: 'application'
  end

  def search
    if params[:city_id].present?
      city_id = City.find(params[:city_id].to_i)
      return redirect_to city_path(city_id)
    end

    redirect_to root_path
  end

  def help
    @visa_types = VisaType.all
  end

  def about
    @article = Article.about_us
  end

  def privacy
  end

  def tos
  end
end
