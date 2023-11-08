# frozen_string_literal: true

require 'faraday'
require 'json'
require 'csv'

class Importer
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

  def initialize(csv_path)
    @csv_path = csv_path
  end

  def exec
    CSV.foreach(@csv_path, headers: true) do |row|
      data_list = {
        'Name' => row['name'],
        'Avatar' => row[' avatar'],
        'Sex' => row[' sex']
      }
      post_data(data_list)
    end
  end

  private

  def post_data(data_list)
    response = @connection.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = data_list.to_json
    end
    if response.success?
      p 'Success'
    else
      p 'Error'
    end
  end

  def connection
    @connection ||= Faraday.new(url: API_URL)
  end
end
