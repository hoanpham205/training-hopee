# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :products,
                                allow_destroy: true,
                                reject_if: proc { |attribute| attribute['name'].blank? || attribute['price'].blank? }
end
