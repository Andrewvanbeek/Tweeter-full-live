Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#rest of the routes
root "users#new"
get '/auth/:provider/callback', to: 'sessions#create'
  resources :users
  resources :sessions
  resources :games
  resources :twitterfeeds
end
