require 'faraday'
require 'json'

class DocExporter
  def initialize(users)
    @users = users
  end

  def exec
    File.open('exported_users.txt', 'w') do |file|
      @users.each do |user|
        file.puts("Name: #{user['name']}, Avatar: #{user['avatar']}, Sex: #{user['sex']}")
      end
    end
  end
end