# frozen_string_literal: true

# user_service.rb
require 'faraday'
require 'json'

class UserService
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1'

  def self.active_users
    response = connection.get('users')
    if response.status == 200
      JSON.parse(response.body)
    else
      []
    end
  end

  def self.delete_user(_user_id)
    response = connection.delete("users/#{Id}")
    response.success?
  end
  def self.create_user(user_data)
    response = connection.post('users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = user_data.to_json
    end
    if response.status == 201
      JSON.parse(response.body)
    else
      nil
    end
  end

  def self.connection
    @connection ||= Faraday.new(url: API_URL)
  end
end
