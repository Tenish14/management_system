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

  get '/categories', to:'categories#index'
  get '/new_categories', to:'categories#new'
  post '/categories', to:'categories#create'

  get '/companies', to:'companies#index'
  get '/new_companies', to:'companies#new'
  post '/companies', to:'companies#create'


  resources :users
end
