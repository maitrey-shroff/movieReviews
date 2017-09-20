json.array! @movies.each do |movie|
  json.partial! 'movie.json.jbuilder', input_movie: movie
end