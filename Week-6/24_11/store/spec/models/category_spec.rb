# frozen_string_literal: true

# spec/models/person_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:products) }

  describe 'nested attributes' do
    it do
      should accept_nested_attributes_for(:products)
        .allow_destroy(true)
    end
  end

  describe 'nested attributes' do
    it 'rejects nested attributes with blank name or price' do
      category_params = {
        name: 'Test Category',
        products_attributes: [
          { name: 'Valid Product', price: 10 },
          { name: '', price: 20 },
          { name: 'Another Valid Product', price: nil }
        ]
      }

      category = Category.new(category_params)
      category.valid?

      puts category.errors.full_messages # Add this line to print error messages
    end
  end

  describe '.ransackable_attributes' do
    subject { described_class.ransackable_attributes }

    it 'returns the correct ransackable attributes' do
      expect(subject).to include('created_at', 'employee_name', 'id', 'id_value', 'updated_at')
    end
  end
end
