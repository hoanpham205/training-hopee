# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.time :date_submited
      t.integer :status
      t.decimal :subtotal
      t.decimal :shopping
      t.decimal :tax
      t.decimal :total
      t.references :customer

      t.timestamps
    end
  end
end
