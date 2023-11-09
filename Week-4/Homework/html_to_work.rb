# frozen_string_literal: true

require 'faraday'
require 'htmltoword'
require 'json'
require 'chartkick'

class Users
  def get_active_users
    response = @connection.get('users')
    return [] unless response.status == 200

    users = JSON.parse(response.body)
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

  def self.generate_table_doc(data_list)

    my_html = '<html><head>'
    my_html += '<style>h1 { text-align: center; font-size: 24px; color: #333; }</style>'
    my_html += '</head><body>'

    my_html += "<h1>Danh sach nguoi dung</h1>"

    my_html += '<table border="1"><tr><th>Id</th><th>Active</th><th>Sex</th><th>Avatar</th>
    <th>Name</th><th>Created At</th></tr>'

    sort_list = data_list.map { |i| i.to_h }
    sort_list.each do |item|
      my_html += '<tr>'
      item.each do |key, value|
        if value.nil?
          my_html += '<td style: {background: "#1322"}></td>'
        else
          my_html += (value.nil? ? '<td></td>' : "<td>#{value}</td>")
        end
      end
      my_html += '</tr>'
  end

  # Kết thúc chuỗi HTML
  my_html += '</table></body></html>'

    docx = Htmltoword::Document.create_and_save(my_html,'/home/hoan/workspace/training-hopee/Week-4/Homework/data_table.docx')
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

active_users = api_client.get_active_users

data_list = active_users.map do |user|
  {
    'Id' => user['id'],
    'Active' => user['active'],
    'Sex' => user['sex'],
    'Avatar' => user['avatar'],
    'Name' => user['name'],
    'Created At' => user['created_at']
  }
end
Users.generate_gender_chart(data_list)

