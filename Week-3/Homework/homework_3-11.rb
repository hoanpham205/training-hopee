# frozen_string_literal: true

require 'faraday'

class Users
  def get_active_users
    response = @connection.get('users')
    return [] unless response.status == 200

    users = JSON.parse(response.body)
    users.select { |user| user['active'] == true }
  end

  def create_user(name, sex, avatar, active)
    user_data = {
      name:,
      sex:,
      avatar:,
      active:,
      created_at: Time.now.to_s
    }

    response = @connection.post('users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = user_data.to_json
    end
    return JSON.parse(response.body) if response.status == 201

    nil
  end

  def delete_user(user_id)
    response = @connection.delete("users/#{user_id}")
    if response.status == 200
      p 'Deleted success!'
    else
      p 'Failed to delete!'
      response.status == 200
    end
  end

  def delete_oldest_user
    sort_users = get_users_filtered

    if sort_users.length.positive?
      user_id = sort_users[0]['id']
      response = @connection.delete("users/#{user_id}")
      return response.status == 200
    end

    false
  end

  def manage_user_list
    max_list = 100
    current_user = get_active_users.count

    while current_user > max_list
      if delete_oldest_user
        current_user -= 1
        p 'Deleted one user.'
      else
        p 'No more user to delete '
        break
      end
    end
  end

  private

  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/'

  def initialize
    @connection = Faraday.new(API_URL)
  end

  def get_users_filtered(params)
    response = @connection.get('users', params)
    return [] unless response.status == 200

    JSON.parse(response.body)
  end
end

api_client = Users.new

# active_users = api_client.get_active_users
# puts 'Active Users:'
# puts active_users

# api_client.create_user('Minh cung yeu Dat rat nhieu', 'bong xa bang',
                       # 'https://www.google.com/url?sa=i&url=https%3A%2F%2Finkythuatso.com%2Fhinh-anh-dep%2Fanh-luffy-4k-3619.html&psig=AOvVaw3Of9g9a2XiK2hIxLX13yne&ust=1699260467094000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJC5hda8rIIDFQAAAAAdAAAAABAN', true)
# puts s = api_client.get_active_users_sort_by_creation_date

api_client.delete_user(89)
