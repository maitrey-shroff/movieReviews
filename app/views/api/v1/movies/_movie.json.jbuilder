json.id input_movie["id"]
json.title input_movie["original_title"]
json.release_date input_movie["release_date"]
json.overview input_movie["overview"]
json.poster "https://image.tmdb.org/t/p/w1280"+input_movie["poster_path"].to_s
json.review_path "/new?movie_id="+input_movie["id"].to_s+"&movie_name="+input_movie["original_title"]
json.movie_reviews_path "/revues/"+input_movie["id"].to_s