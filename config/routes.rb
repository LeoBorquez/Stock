Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "user/registrations"} # calling custom controller
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#index'

  get 'portafolio', to: 'users#portafolio'
  get 'stocks', to: 'stocks#search'
  get 'friends', to: 'users#friends'
  get 'search_friends', to: 'users#search'

  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :friendships


end