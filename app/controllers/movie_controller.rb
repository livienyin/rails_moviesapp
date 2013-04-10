class MovieController < ApplicationController

	def home
	end

	def results
    @query = params[:q]
    @button = params[:button]
    s = MovieSearch.new
    @results = s.search(@query)
	end

  def detail
    @id = params[:id]
    m = Movie.new
    @detail = m.show_details(@id)
    @actors = @detail["Actors"].split(", ")
    @directors = @detail["Director"].split(", ")
  end
	
	# get '/search' do
  #   
  #   @button = params[:button]
 #  		file = open("http://www.omdbapi.com/?s=#{URI.escape(@query)}")
 #  		@results = JSON.load(file.read)["Search"] || []
 #  	if @results.size == 1 || (@results.size > 1 && @button == "lucky")
 #    	redirect "/movies?id=#{@results.first["imdbID"]}&q=#{@query}"
 #  	else
 #    	erb :serp                                                                                                               end
	# end

end
