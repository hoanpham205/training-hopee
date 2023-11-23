# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy, inverse_of: :author

  accepts_nested_attributes_for :books
end
