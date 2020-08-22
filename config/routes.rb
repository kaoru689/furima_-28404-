Rails.application.routes.draw do
  devise_for :users
  get 'images/index'
  root "items#index"


  resources :users , only: [:new ]
  resources :items , only:[:new ,:create, :show, :update ]
  
  end
