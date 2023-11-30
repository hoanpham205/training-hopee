# frozen_string_literal: true

class Person < ApplicationRecord
  validates :full_name, :phone, :age, :email, presence: true
  validates :phone, numericality: { only_integer: true, message: 'Please enter only numbers' }

  enum gender: { male: 0, female: 1 }
  has_one_attached :avatar
  def self.ransackable_attributes(_auth_object = nil)
    %w[address age created_at email full_name gender id id_value phone updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[avatar_attachment avatar_blob]
  end
end
