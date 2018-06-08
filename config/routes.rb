Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/revues" => "reviews#index"
  get "/" => "api/v1/movies#index"
  # get "/1" => "api/v1/movies#index"

  get "/new" => "reviews#new"
  post "/create" => "reviews#create"

  get "/revues/:movie_id" => "reviews#show"

  namespace :api do
    namespace :v1 do
      get "/movies", to: "movies#index"
    end
  end

end