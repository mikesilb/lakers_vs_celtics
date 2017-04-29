Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index]
  root 'static_pages#index'
end
