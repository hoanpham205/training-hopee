# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author, counter_cache: true, inverse_of: :books
end
