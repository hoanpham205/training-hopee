# frozen_string_literal: true

Rails.application.routes.draw do
  root 'client/index'
  get 'books/index'

  resources :client
end
