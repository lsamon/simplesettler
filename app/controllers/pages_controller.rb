class PagesController < ApplicationController
  def index
    @cities = City.all
    @articles = Article.all
  end

  def about
  end

  def contact
  end

  def faq
  end

  def tos
  end

  def privacy_policy
  end
end
