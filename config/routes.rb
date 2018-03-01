Rails.application.routes.draw do
  get 'attractions/index'

  get '/signin', to: 'sessions#new'

  resources :users
  resources :attractions
  resources :rides, only: [:create]
  resources :sessions, only: [:index, :create, :edit, :update, :show, :destroy]
  root to: 'users#index'
end
