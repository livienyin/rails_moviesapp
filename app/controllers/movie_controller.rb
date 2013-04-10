class MovieController < ApplicationController

  def home
  end

  def results
    @movie_search = MovieSearch.new params[:q]
    # @movie_search =  MovieSearch.new.search params[:q]
  end

  def detail
    @query = params[:q]
    @movie = Movie.build_from_id params[:id]
  end

end
