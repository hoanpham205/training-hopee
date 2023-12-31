# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :images
end
