Rails.application.routes.draw do

  root'posts#index'

  get 'comments/index'

  get 'comments/new'

  resources :users do
    member do
      get :following, :followers  
    end
  end

  resources :posts do 
    resources :comments, only: [:index, :create]
    get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
    member do
      put 'like', to: 'posts#upvote'
    end
  end

  resources :relationships, only: [:create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create_from_twitter'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get 'search', to: 'search#search'
  get 'search_form', to: 'search#search_form'
end
