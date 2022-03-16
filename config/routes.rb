Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/users', to:'users#index'
  get 'users/:id', to: 'users#destroy'
  delete 'users/:id', to: 'users#destroy', as: 'users_delete'


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
