class Api::V1::MoviesController < ApplicationController

  MOVIE_DB_URL = "https://api.themoviedb.org/3/discover/movie?language=en-US"
  RELEASE_DATE_DESC_URL = "sort_by=release_date.desc"
  TITLE_DESC_URL = "sort_by=original_title.desc"
  GENRE_URL = "https://api.themoviedb.org/3/genre/movie/list?language=en-US"

  # Method for creating the movies-app API that is used for the AJAX API call in movies.js
  def index
    # if page value a param, use that, else ...
    page = 3
    request_url = MOVIE_DB_URL + "&api_key=#{ENV["API_KEY"]}"
    genre_request_url = GENRE_URL + "&api_key=#{ENV["API_KEY"]}"
    request_url += "&page=#{page}"
    # if sort by release date
    # request_url += RELEASE_DATE_DESC_URL
    # if sort by title
    # request_url += RELEASE_DATE_DESC_URL;
    @movies = Unirest.get(request_url).body["results"]
    @genres = Unirest.get(genre_request_url).body["genres"]
    puts @genres
  end

end