Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/login', to: 'authentication#login'

  resources :users

  namespace :api do
    namespace :v1 do
      resources :resources
    end
  end
end
