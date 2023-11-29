# frozen_string_literal: true

# spec/factories/categories.rb

FactoryBot.define do
  factory :categories do
    name { Faker::Name.name }
  end
end
