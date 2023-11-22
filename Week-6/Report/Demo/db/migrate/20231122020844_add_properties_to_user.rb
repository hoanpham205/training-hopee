class AddPropertiesToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :properties, :text
  end
end
