Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/recommended', to: 'books#recommended'

  resources :genres
  
  resources :books do 
    resources :reviews, only: [:index, :new, :create]
  end 

  resources :reviews, only: [:edit, :show, :update, :destroy]

 
  resources :users do 
    resources :lists, only: [:index, :new, :create, :show]
  end 

  resources :lists, only: [:edit, :update, :destroy] do
    resources :books, only: [:destroy] 
  end
  
end
