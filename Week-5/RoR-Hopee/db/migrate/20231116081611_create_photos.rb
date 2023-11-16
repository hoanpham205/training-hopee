# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.string :url

      t.timestamps
    end
  end
end
