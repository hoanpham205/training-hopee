# frozen_string_literal: true

class CreateParts < ActiveRecord::Migration[7.1]
  def change
    create_table :parts, &:timestamps
  end
end
