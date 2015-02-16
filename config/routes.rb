Rails.application.routes.draw do

  root 'static_pages#home'

  resources :users
  resources :posts do 
    member do
      put 'like', to: 'posts#upvote'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
end
