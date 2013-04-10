require 'open-uri'

class MovieSearch
  attr_accessor :query

  def search(query)
    file = open("http://www.omdbapi.com/?s=#{URI.escape(query)}")
    JSON.load(file.read)["Search"] || []
    # if @results.size == 1 || (@results.size > 1 && @button == "lucky")
    #   redirect "/movies?id=#{@results.first["imdbID"]}&q=#{query}"
    # else
    #   erb :serp
    # end
  end

end
