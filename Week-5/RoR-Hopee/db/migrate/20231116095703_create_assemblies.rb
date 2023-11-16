# frozen_string_literal: true

class CreateAssemblies < ActiveRecord::Migration[7.1]
  def change
    create_table :assemblies, &:timestamps
  end
end
