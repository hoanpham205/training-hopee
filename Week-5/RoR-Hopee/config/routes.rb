# frozen_string_literal: true

Rails.application.routes.draw do
  get 'books/index'

  resources :books
end
