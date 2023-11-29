# frozen_string_literal: true

# spec/factories/people.rb
FactoryBot.define do
  factory :person do
    full_name { Faker::Name.name }
    age { Faker::Number.between(from: 1, to: 100) }
    gender { Faker::Number.between(from: 0, to: 1) }
    email { Faker::Internet.email }
    phone { Faker::Number.number(digits: 10) }
    address { Faker::Address.full_address }
  end
end
