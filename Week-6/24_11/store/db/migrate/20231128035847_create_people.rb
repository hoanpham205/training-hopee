# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :full_name
      t.integer :age
      t.integer :gender
      t.string :email
      t.integer :phone
      t.string :address

      t.timestamps
    end
  end
end
