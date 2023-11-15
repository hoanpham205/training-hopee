class Person < ApplicationRecord
  validates :name, presence: true
  validates :term_of_service, acceptance: {accept: 'yes'}
  validates :eula, acceptance: {accept: ['TRUE', 'accepted']}
  validates :name, length: {minimum:3, maximum:50}
  validates :name, uniqueness: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true, if: :email_changed?

end
