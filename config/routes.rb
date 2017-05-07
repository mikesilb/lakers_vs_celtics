Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :destroy]

  root "nbafinals#index"

  namespace :api do
    namespace :v1 do
      resources :nbafinals, only: [:index, :show, :create]
    end
  end

  resources :nbafinals do
    resources :reviews, only: [:new, :create, :update, :destroy]
  end
  resources :nbafinals do
    resources :images, only: [:new, :create, :update, :destroy]
  end
  resources :nbafinals do
    resources :videos, only: [:new, :create, :update, :destroy]
  end

  resources :reviews, only: [:edit, :update, :destroy]
  resources :images, only: [:edit, :update, :destroy]
  resources :videos, only: [:edit, :update, :destroy]

  #
  # get '/api/colors', to: "colors#data"
  # get '/api/reviews', to: "reviews#data"
  # get '/api/users', to: "users#data"
  # get '/api/current_user', to: "current_user#data"
end
