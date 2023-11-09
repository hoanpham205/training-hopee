# frozen_string_literal: true

require 'faraday'
require 'htmltoword'
require 'json'
require 'gruff'

class BuilChart
  def get_active_users
    response = @connection.get('users')
    return [] unless response.status == 200

    users = JSON.parse(response.body)
  end

  def generate_gender_chart(data_list)
    gender_counts = data_list.group_by { |user| user['Sex'] }.transform_values(&:count)
    g = Gruff::Candlestick.new
    g.title = 'Biểu đồ Giới Tính'
    # gender_counts.each { |gender, count| g.data(gender, count) }
    # g.data = { 'male' => 'Nam', 'female' => 'Nữ' } 
    g.data low:  79.30, high:  93.10, open:  79.44, close:  91.20
    g.data low:  89.14, high: 106.42, open:  91.28, close: 106.26
    g.data low: 107.89, high: 131.00, open: 108.20, close: 129.04
    g.data low: 103.10, high: 137.98, open: 132.76, close: 115.81
    chart_image = '/home/hoan/workspace/training-hopee/Week-4/Test-Chart/chart.png'
    g.write(chart_image)

    docx = Htmltoword::Document.create('/home/hoan/workspace/training-hopee/Week-4/Test-Chart/template.html')

    # Thêm hình vào tài liệu Word
    docx.images << { path: chart_image, width: 400, height: 300, paragraph_style: { alignment: :center } }

    # Lưu tài liệu Word
    docx.create_and_save('/home/hoan/workspace/training-hopee/Week-4/Test-Chart/output.docx')
    
    # docx= Htmltoword::Document.create_and_save(chart_image,'/home/hoan/workspace/training-hopee/Week-4/Test-Chart/output.docx')
  end

  private

  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/'

  def initialize
    @connection = Faraday.new(API_URL)
  end

end

api_client = BuilChart.new

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

api_client.generate_gender_chart(data_list)
