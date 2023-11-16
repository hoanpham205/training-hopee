# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :reviewable_id
      t.string :reviewable_type

      t.timestamps
    end
    add_index :reviews, %i[reviewable_type reviewable_id]
    # Ex:- add_index("admin_users", "username")
  end
end
