# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
end
