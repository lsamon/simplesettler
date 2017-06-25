class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:help]
  # layout 'user'
  def index
    @cities = City.all
    @articles = Article.all
    @banner = Banner.first
  end

  def help
    @visa_types = VisaType.all
  end

  def about
    @article = Article.about_us
    render layout: 'pages'
  end

  def privacy
  end

end
