# frozen_string_literal: true

require 'net/http'
require 'uri'

class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:help]
  layout 'pages'
  def index
    @cities = City.all

    store_page_access_token if params[:code]
  end

  def search
    if params[:city_id].present?
      city_id = City.find(params[:city_id].to_i)
      return redirect_to(city_path(city_id))
    end

    redirect_to(root_path)
  end

  def subscribe
    return redirect_to(root_path) unless params[:email].present?

    begin
      SubscribeUserToMailingListJob.perform_now(params[:email])
      message = "Thank you for subscribing to SimpleSettler's Guide Newsletter!"
      render(json: { message: message })
    rescue Gibbon::MailChimpError => e
      respond_to do |format|
        format.json { render json: { error: e.detail }, status: 400 }
      end
    end
  end

  def help
    @visa_types = VisaType.all
  end

  def about; end

  def privacy; end

  def tos; end

  def jobs; end

  private

  def store_page_access_token
    # return User.last.facebook_page_token if User.last.facebook_page_token

    oauth = Koala::Facebook::OAuth.new
    # get url for access_token
    access_token_url = oauth.url_for_access_token(params[:code])
    graph_response = graph_response(access_token_url)
    access_token = graph_response['access_token']
    user_graph = Koala::Facebook::API.new(access_token)
    page_info = user_graph.get_connections('me', 'accounts').first
    User.last.update(
      facebook_page_token: page_info['access_token'],
      facebook_page_id: page_info['id']
    )
  rescue Koala::KoalaError => e
    raise e.message
  end

  def graph_response(url)
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)

    req_options = { use_ssl: uri.scheme == 'https' }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    JSON.parse(response.body)
  end
end
