# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { minimum: 5 }

  after_create_commit :increment_post_comments_count
  after_destroy_commit :decrement_post_comments_count

  private

  def increment_post_comments_count
    post.increment!(:comments_count)
  end

  def decrement_post_comments_count
    post.decrement!(:comments_count)
  end
end
