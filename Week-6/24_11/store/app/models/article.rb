# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[body created_at id id_value title updated_at]
  end
end
