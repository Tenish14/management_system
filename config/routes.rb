Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  get '/users', to:'users#index'
  get 'users/:id', to: 'users#destroy'
  delete 'users/:id', to: 'users#destroy', as: 'users_delete'


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

  get '/locations', to:'locations#index'
  get '/new_locations', to:'locations#new'
  post '/locations', to:'locations#create'

  get '/suppliers', to:'suppliers#index'
  get '/new_suppliers', to:'suppliers#new'
  post '/suppliers', to:'suppliers#create'

  resources :users
end
