# frozen_string_literal: true

require 'csv'

data_list = []

CSV.foreach('users.csv', headers: true) do |row|
  data_list << {
    'Name' => row['name'],
    'Avatar' => row[' avatar'],
    'Sex' => row[' sex']
  }
end
p data_list
