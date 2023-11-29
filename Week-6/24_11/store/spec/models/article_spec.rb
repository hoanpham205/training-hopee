# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.title = 'Anything'
    subject.body = 'Anything'
    expect(subject).to be_valid
  end

  it 'is not valid without a title'
  it 'is not valid without a start_date'
  it 'is not valid without a end_date'

  describe '.ransackable_attributes' do
    subject { described_class.ransackable_attributes }

    it 'returns the correct ransackable attributes' do
      expect(subject).to include('body', 'title')
    end
  end
end
