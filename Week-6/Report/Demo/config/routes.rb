# frozen_string_literal: true

Rails.application.routes.draw do
  resources :people
  root 'authors#index'
  resources :users
  resources :authors
  resources :books
  resources :students
  resources :authors_books
  get 'signup', to: 'people#new'
 
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
