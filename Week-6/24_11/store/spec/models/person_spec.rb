# frozen_string_literal: true

# spec/models/person_spec.rb
require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to validate_presence_of(:full_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_presence_of(:age) }

  describe 'database columns' do
    it { is_expected.to have_db_column(:full_name).of_type(:string) }
    it { is_expected.to have_db_column(:age).of_type(:integer) }
    it { is_expected.to have_db_column(:gender).of_type(:integer) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:integer) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
  describe '.ransackable_attributes' do
    it 'returns the correct ransackable attributes' do
      # Gọi phương thức ransackable_attributes và kiểm tra xem kết quả có đúng hay không
      ransackable_attributes = Person.ransackable_attributes

      expect(ransackable_attributes).to include('address')
      expect(ransackable_attributes).to include('created_at')
      expect(ransackable_attributes).to include('id')
      expect(ransackable_attributes).to include('id_value')
      expect(ransackable_attributes).to include('phone')
      expect(ransackable_attributes).to include('updated_at')
    end
  end

  describe '.ransackable_associations' do
    subject { described_class.ransackable_associations }

    it 'returns the correct ransackable associations' do
      expect(subject).to include('avatar_attachment', 'avatar_blob')
    end
  end
end
