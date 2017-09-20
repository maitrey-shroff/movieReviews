Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/" => "reviews#home"

  namespace :api do
    namespace :v1 do
      get "/movies", to: "movies#index"
    end
  end

end