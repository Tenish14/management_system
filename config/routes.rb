Rails.application.routes.draw do
  root 'items#index'

  get '/signup', to: 'users#new'
  get '/users', to:'users#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
  resources :companies
  resources :roles
  resources :items
  resources :categories
  resources :locations
  resources :suppliers
end
