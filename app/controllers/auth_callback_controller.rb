# frozen_string_literal: true

# facebook auth_callback controller
class AuthCallbackController < ApplicationController
  def index
    render text: "good stuff"
  end
end
