module Itunes
  class Search
    def self.by_term(term)
      Faraday.get 'https://itunes.apple.com/search?' + term + '&entity=podcast'
  end
end
