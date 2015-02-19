Rails.application.routes.draw do

  root 'static_pages#home'

  resources :users
<<<<<<< Updated upstream
  resources :posts do 
    member do
      put 'like', to: 'posts#upvote'
    end
  end
=======
  resources :posts
>>>>>>> Stashed changes

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
end
