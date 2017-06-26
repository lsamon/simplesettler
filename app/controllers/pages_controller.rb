class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:help]
  layout 'pages'
  def index
    @cities = City.all
    @articles = Article.all
    @banner = Banner.first
    render layout: 'application'
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
