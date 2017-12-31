class JobsController < ApplicationController
  def search
    begin
      body = Indeed.new.connect(indeed_params(query: params[:q], location: params[:l]))
      @results = JSON.parse(body)['results']
      @results = sort_results(@results, 'date', false) if @results.any?
    rescue RestClient::ExceptionWithResponse => e
      @errors = e.response
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def sort_results(data, attribute, asc = true)
    sorted = data.sort_by { |elem| Date.parse elem[attribute] }
    asc ? sorted : sorted.reverse
  end

  def indeed_params(options={})
    {
      q: options[:query],
      l: options[:location],
      limit: 25,
      co: 'au',
      useragent: request.user_agent,
      userip: request.remote_ip,
      format: 'json',
      v: 2
    }
  end
end
