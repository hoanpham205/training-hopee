# frozen_string_literal: true

Rails.application.routes.draw do
  resources :people
  resources :articles
  resources :users
  resources :employees
  root 'people#index'
  resources :categories
  resources :products
end
