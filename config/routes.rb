Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :home, only: :index

  resources :browse, only: :index
  resources :upvotes, only: :create
end
