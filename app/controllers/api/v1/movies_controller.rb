class Api::V1::MoviesController < ApplicationController

  # Method for creating the movies-app API that is used for the AJAX API call in movies.js
  def index
    @movies = []
    x = 1
    while x<4 do
      movies = Unirest.get("https://api.themoviedb.org/3/movie/now_playing?api_key=#{ENV["API_KEY"]}&language=en-US&page=#{x}").body
      @movies = @movies + movies["results"]
      x = x+1
    end

  end

end