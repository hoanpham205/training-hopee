# frozen_string_literal: true

# spec/models/person_spec.rb
require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'nested attributes' do
    it do
      should accept_nested_attributes_for(:addresses)
        .allow_destroy(true)
    end
  end

  describe 'nested attributes' do
    it 'rejects nested attributes with blank name or price' do
      employee_params = {
        employee_name: 'Phi Hoan',
        addresses_attributes: [
          { house_number: 47, society_name: 'adv', city: 'San Francisco', area: 'San Francisco' },
          { house_number: 11, society_name: 'abc' },
          { house_number: 76, society_name: 'azsx' }
        ]
      }

      employee = Employee.new(employee_params)
      employee.valid?

      puts employee.errors.full_messages # Add this line to print error messages
    end
  end
end
