# frozen_string_literal: true

module Facebook
  # Facebook::WebhookController
  class WebhookController < ApplicationController
    protect_from_forgery prepend: true

    def index
      verify_token = '2019a2eb17a049a51ce6185aaa6ecf69'
      mode = params['hub.mode']
      token = params['hub.verify_token']
      challenge = params['hub.challenge']

      if mode == 'subscribe' && token == verify_token
        render plain: challenge, status: 200
      else
        render plain: 'FAILED_TO_VERIFY_TOKEN', status: 403
      end
    end

    def create
      puts 'here'
      puts "Save the details of the #{params[:object]} to the database"
      puts 'here'

      render plain: params[:object], status: :ok
    end
  end
end
