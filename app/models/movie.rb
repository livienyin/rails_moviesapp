require 'open-uri'

class Movie

  def self.build_from_id(id)
    file = open("http://www.omdbapi.com/?i=#{URI.escape(id)}&tomatoes=true")
    new(JSON.load(file.read))
  end

  def initialize(movie_data)
    @movie_data = movie_data
  end

  def id
    @movie_data["imdbID"]
  end

  def actors
    @movie_data["Actors"].split(", ")
  end

  def directors
    @movie_data["Director"].split(", ")
  end

  def title
    @movie_data["Title"]
  end

  def year
    @movie_data["Year"]
  end

  def poster
    return nil if @movie_data["Poster"] == "N/A"
    @movie_data["Poster"]
  end

  def plot
    @movie_data["Plot"]
  end

  def genre
    @movie_data["Genre"]
  end

  def imdb_rating
    @movie_data["imdbRating"]
  end

  def rt_rating
    @movie_data["tomatoRating"]
  end

  def rated
    @movie_data["Rated"]
  end
  
  def runtime
    @movie_data["Runtime"]
  end

  def url_for_query(query)
    "/movies?" + {"id" => self.id, "q" => query}.to_query
  end

end
