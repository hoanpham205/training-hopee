# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name
      t.boolean :sex
      t.string :email

      t.timestamps
    end
  end
end
