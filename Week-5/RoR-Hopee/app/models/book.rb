# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :supplier
  has_many :reviews
  has_and_belongs_to_many :orders, join_table: 'books_orders'

  scope :in_print, -> { where(out_of_print: false) }
  scope :out_of_print, -> { where(out_of_print: true) }
  scope :old, -> { where(year_published: ...50.years.ago.year) }
  scope :recent, -> { where(year_published: 50.years.ago.year..) }
  scope :out_of_print_and__expensive, -> { out_of_print.where('price > 500') }
  scope :costs_more_than, ->(amount) { where('price > ?', amount) }
  # Ex:- scope :active, -> {where(:active => true)}
end
