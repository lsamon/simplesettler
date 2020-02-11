# frozen_string_literal: true

module Facebook
  # FacebookConnectController
  class ConnectController < ApplicationController
    def create
      @oauth = Koala::Facebook::OAuth.new
      url =
        @oauth.url_for_oauth_code(permissions: 'manage_pages, publish_pages')

      redirect_to url
    end
  end
end
