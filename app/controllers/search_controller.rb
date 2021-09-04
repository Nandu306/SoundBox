class SearchController < ApplicationController

  include Pagy::Backend

  def index

    @response = Faraday.get do |req|
      req.url "https://itunes.apple.com/search?"
      # req.params['api_key'] = Rails.application.secrets.active_api_key
      req.params['term'] = params[:search][:term]
      req.params['media'] = "podcast"
      req.params['lang'] = "en_us"
      # req.params['limit'] = 20
      # req.params['offset'] = 100

      req.params['explicit'] = "No"
      # req.params['country'] = "GB"
    end

    @json = JSON.parse(@response.body)

    @pagy_a, @results = pagy_array(@json['results'], items: 12)



  end


end
