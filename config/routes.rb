Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/new'

  root 'static_pages#home'

  resources :users
  resources :posts do 
    resources :comments, only: [:index, :create]
    get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
    member do
      put 'like', to: 'posts#upvote'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create_from_twitter'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
end
