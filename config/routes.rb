Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :users , only: [:new ]
  resources :items 
  resources :orders, only:[:create]
  
  end
