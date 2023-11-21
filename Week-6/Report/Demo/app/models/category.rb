# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :destroy, counter_cache: true
end
