class SearchController < ApplicationController

  def index

    @response = Faraday.get do |req|
      req.url "https://itunes.apple.com/search?"
      # req.params['api_key'] = Rails.application.secrets.active_api_key
      req.params['term'] = params["term"]
      req.params['media'] = "podcast"
      req.params['lang'] = "en_us"
      # req.params['explicit'] = "No"
      # req.params['country'] = "GB"
    end
    @json = JSON.parse(@response.body)

  end


end
