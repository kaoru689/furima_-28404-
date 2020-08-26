Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :users , only: [:new ]
  resources :items , only:[:new ,:create, :show, :update, :edit, :destroy]
  
  end
