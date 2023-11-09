require 'csv'
require 'faker'
require 'faraday'

max_users = 32

users =[]

max_users.times do 
  name = Faker::Name.unique.name
  sex = Faker::Gender.binary_type
  active = Faker::Boolean.boolean
  avatar = Faker::Avatar.image
  created_at = Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)
  users << [name, sex, avatar, active, created_at]
end

CSV.open('users.csv','wb') do |csv|
  csv << ['Name', 'Active', 'Avatar', 'Sex', 'Created_at']
  users.each do |user|
    csv << user
  end
end

p 'Success'