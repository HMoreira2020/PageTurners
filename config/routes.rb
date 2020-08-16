Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :genres
  resources :reviews
  resources :books
 
  resources :users do 
    resources :lists
  end 

  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
