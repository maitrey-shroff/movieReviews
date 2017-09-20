class Api::V1::MoviesController < ApplicationController

  def index
    @movies = Unirest.get("https://api.themoviedb.org/3/movie/now_playing?api_key=08680559d6fc65313f828456eb8b4b29&language=en-US&page=1.json").body
    @movies = @movies["results"]
  end

end
