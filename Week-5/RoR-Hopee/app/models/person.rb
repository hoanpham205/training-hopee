# frozen_string_literal: true

class Person < ApplicationRecord
  validates :name, presence: true
  validates :term_of_service, acceptance: { accept: 'yes' }
  validates :eula, acceptance: { accept: %w[TRUE accepted] }
  validates :name, length: { minimum: 3, maximum: 50 }
  validates :name, uniqueness: true
  validates :email, presence: true

  before_save :ensure_email_valid

  after_initialize do |_user|
    puts 'You have initialized an object!'
  end

  after_save -> { puts 'Created Person!!!' }
  private

  def ensure_email_valid
    email.downcase!
  end
end
