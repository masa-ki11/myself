Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: [:show, :create, :new, :edit, :update] do
    member do
      get :followings
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
