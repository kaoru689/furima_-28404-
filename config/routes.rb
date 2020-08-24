Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :users , only: [:new ]
  resources :items , only:[:new ,:create, :show, :update ]

  # devise_scope :user do
  #   root to: 'destroy_user_session'
  # end

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  
  end
