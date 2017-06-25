class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:help]
  layout 'application'
  def index
    @cities = City.all
    @articles = Article.all
    @banner = Banner.first
  end

  def help
    @visa_types = VisaType.all
    render layout: 'pages'
  end

  def about
    @article = Article.about_us
    render layout: 'pages'
  end

  def privacy
  end

end
