# frozen_string_literal: true

class Article < ApplicationRecord
  scope :published, -> { where(published: true) }
  # Ex:- scope :active, -> {where(:active => true)}
  scope :recent, -> { order(created_at: :desc) }
end
