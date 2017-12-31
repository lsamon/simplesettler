class Indeed
  PUBLISHER_KEY = ENV['INDEED_PUBLISHER_KEY']
  def connect(params)
    params.reverse_merge!(publisher: PUBLISHER_KEY)
    RestClient.get 'http://api.indeed.com/ads/apisearch', {content_type: :json, accept: :json, params: params}
  end
end
