require 'faraday'

class Api
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/'.freeze

  def initialize
    @connection = Faraday.new(API_URL)
  end

  def get_active_users
    response = @connection.get('users')
    if response.status == 200
      users = JSON.parse(response.body)
      active_users = users.select { |user| user['active'] == true }
      return active_users
    else
      return []
    end
  end

  def create_user(name, sex, avatar)
    user_data = {
      name: name,
      sex: sex,
      avatar: avatar,
      active: false,
      created_at: Time.now.to_s 
    }

    response = @connection.post('users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = user_data.to_json
    end
    if response.status == 201
      return JSON.parse(response.body)
    else
      return nil 
    end
  end

  def delete_user(user_id)
    response = @connection.delete("users/#{user_id}")
    if response.status == 200
      p 'Deleted success!'
    else
      p 'Failed to delete!'
      return response.status == 200
    end
  end

 
  def get_active_users_sort_by_creation_date
    response = @connection.get('users')
    if response.status == 200
      users = JSON.parse(response.body)
      users.reject! { |user| user['created_at'].nil? }
      sort_users = users.sort_by { |user| user['created_at']}
      return sort_users 
    else
      return []
    end
  end

  def delete_oldest_user
    sort_users = get_active_users_sort_by_creation_date

    if sort_users.length > 0
      user_id = sort_users[0]['id']
      response = @connection.delete("users/#{user_id}")
      return response.status == 200
    end

    return false
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
end

api_client = Api.new

# active_users = api_client.get_active_users
# puts 'Active Users:'
# puts active_users

# new_user = api_client.create_user('Luffy', 'male', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Finkythuatso.com%2Fhinh-anh-dep%2Fanh-luffy-4k-3619.html&psig=AOvVaw3Of9g9a2XiK2hIxLX13yne&ust=1699260467094000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJC5hda8rIIDFQAAAAAdAAAAABAN')
puts s = api_client.get_active_users_sort_by_creation_date

# dele_user = api_client.delete_user(189)
