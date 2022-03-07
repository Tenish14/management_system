Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/cripsy_burger', as: 'rails_admin'
  root 'static_pages#home'
  get '/signup',  to: 'users#new'

  resources :users
end
