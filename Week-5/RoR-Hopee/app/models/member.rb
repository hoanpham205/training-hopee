class Member < ApplicationRecord
  has_one :avatar 
  accepts_nested_attributes_for :avatar, allow_destroy: true
end
