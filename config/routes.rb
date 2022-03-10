Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/cripsy_burger', as: 'rails_admin'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/users', to:'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/roles', to:'roles#index'
  get '/new', to:'roles#new'
  post '/roles', to:'roles#create'
  get '/items', to:'items#index'
  get '/new_items', to:'items#new'
  post '/items', to:'items#create'
  get '/categories', to:'category#index'
  get '/new_categories', to:'category#new'
  post '/categories', to:'category#create'


  resources :users
end
