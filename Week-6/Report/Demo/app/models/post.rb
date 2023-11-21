# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :category
  has_many :comments, dependent: :destroy

  enum status: { draft: 0, published: 1 }

  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true
  validates :status, inclusion: { in: statuses.keys }

  scope :published, -> { where(status: statuses[:published]) }
  scope :draft, -> { where(status: statuses[:draft]) }

  after_create_commit :increment_category_posts_count
  after_destroy_commit :decrement_category_posts_count

  private

  def increment_category_posts_count
    category.increment!(:posts_count)
  end

  def decrement_category_posts_count
    category.decrement!(:posts_count)
  end
end
