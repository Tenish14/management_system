Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/cripsy_burger', as: 'rails_admin'
  get 'user/new'
  root 'static_pages#home'
end
