# frozen_string_literal: true

require 'csv'
require 'httparty'
require 'faraday'

class Users
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

  def get_active_users
    response = @connection.get
    return [] unless response.status == 200

    JSON.parse(response.body)
  end

  def import_user
    CSV.foreach('users.csv', headers: true) do |row|
      data_list = {
        'Name' => row['name'],
        'Avatar' => row[' avatar'],
        'Sex' => row[' sex']
      } 
      p data_list
      p post_data(data_list)
    end
  end

  def post_data(data_list)
    response = @connection.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = data_list.to_json
    end
    if response.success?
      puts "successfully."
    else
      puts "Failed "
    end
  end

  def initialize
    @connection ||= Faraday.new(url: API_URL)
  end

  def to_json(*_args)
    JSON.generate(self) 
  end

end

data = Users.new


p data.import_user

