# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :products,
                                allow_destroy: true,
                                reject_if: proc { |attribute| attribute['name'].blank? || attribute['price'].blank? }
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at employee_name id id_value updated_at]
  end
end
