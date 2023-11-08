# frozen_string_literal: true

require 'csv'
require 'httparty'
require 'faraday'

class Users
  def get_active_users
    response = @connection.get('users')
    return [] unless response.status == 200

    JSON.parse(response.body)
  end

  def self.import_user
    CSV.foreach('users.csv', headers: true) do |row|
      data_list = {
        'Name' => row['name'],
        'Avatar' => row[' avatar'],
        'Sex' => row[' sex']
      }
      response = HTTParty.post(API_URL, body: data_list.to_json, headers: { 'Content-Type' => 'application/json' })
      if response.success?
        puts "User #{data_list[:name]} imported successfully."
      else
        puts "Failed to import user #{data_list[:name]}. Error: #{response.code} - #{response.body}"
      end
    end
  end

  def to_json(*_args)
    JSON.generate(self) 
  end

  private

  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

  def initialize
    @connection = Faraday.new(API_URL)
  end
end

p Users.import_user
