# frozen_string_literal: true

class Photo < ApplicationRecord
  has_many :reviews, as: :reviewable
end
