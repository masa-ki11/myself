Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: [:edit, :update]
end