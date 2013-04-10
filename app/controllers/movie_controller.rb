class MovieController < ApplicationController

  def home
  end

  def results
    @movie_search = MovieSearch.new params[:q]
  end

  def detail
    @movie = Movie.build_from_id params[:id]
  end

end
