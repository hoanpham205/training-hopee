# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :reviews, as: :reviewable
end
