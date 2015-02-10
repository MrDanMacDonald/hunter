Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
end
