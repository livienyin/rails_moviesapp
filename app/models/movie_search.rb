require 'open-uri'

class MovieSearch
  attr_accessor :query, :movies

  def initialize(query)
    @query = query
    file = open("http://www.omdbapi.com/?s=#{URI.escape(query)}")
    result_entries = JSON.load(file.read)["Search"] || []
    @movies = result_entries.map{|movie_data| Movie.new movie_data}
  end

  # separate from initialize method
  # def search(query)
  #   file = open("http://www.omdbapi.com/?s=#{URI.escape(query)}")
  #   result_entries = JSON.load(file.read)["Search"] || []
  #   @movies = result_entries.map{|movie_data| Movie.new movie_data}
  # end
end
