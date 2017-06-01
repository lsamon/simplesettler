class Dashboard::FaqsController < ApplicationController
  layout 'shared/dashboard'
  def index
    @faqs = Faq.all
  end

end
