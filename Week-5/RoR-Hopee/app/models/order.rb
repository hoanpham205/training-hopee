# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :books, join_table: 'books_orders'

  enum :status, %i[shipped being_packer complete cancelled]
  scope :created_before, ->(time) { where(created_at: ...time) }
  scope :created_in_time_range, lambda { |time_range|
    where(created_at: time_range)
  }
end
