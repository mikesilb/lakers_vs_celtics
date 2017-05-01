Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :destroy]

  root "static_pages#index"
  resources :nbafinals do
    # resources :reviews, only: [:create]
  end

  # resources :reviews, only: [:edit, :update, :destroy]
  #
  # get '/api/colors', to: "colors#data"
  # get '/api/reviews', to: "reviews#data"
  # get '/api/users', to: "users#data"
  # get '/api/current_user', to: "current_user#data"
end
