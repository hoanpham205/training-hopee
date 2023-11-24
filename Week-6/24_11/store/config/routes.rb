# frozen_string_literal: true

Rails.application.routes.draw do
  resources :employees
  root 'employees#index'
  resources :categories
end
