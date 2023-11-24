# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_rich_text :content
end
