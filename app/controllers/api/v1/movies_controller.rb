class Api::V1::MoviesController < ApplicationController

  def index
    @movies = []
    x = 1
    while x<4 do
      movies = Unirest.get("https://api.themoviedb.org/3/movie/now_playing?api_key=08680559d6fc65313f828456eb8b4b29&language=en-US&page=#{x}").body
      @movies = @movies + movies["results"]
      x = x+1
    end
  end

end