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

  private

  def self.connection
    @connection ||= Faraday.new(url: API_URL)
  end
end
