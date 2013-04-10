require 'open-uri'

class Movie
  attr_accessor :results, :id

  def show_details(id)
    file = open("http://www.omdbapi.com/?i=#{URI.escape(id)}&tomatoes=true")
    JSON.load(file.read)
  end

end
