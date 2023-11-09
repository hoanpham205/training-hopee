require 'faraday'
require 'nokogiri'

url = 'https://vnexpress.net/so-hoa/cong-nghe/ai'
response = Faraday.get(url)
  doc = Nokogiri::HTML(response.body)


  doc.css('nav ul.menu li a', 'article h2 a').each do |link|
    puts link.content
    puts link['href']
    
  end
  

  # Sử dụng Nokogiri để phân tích HTML
  # doc = Nokogiri::HTML(response.body)

  # news_list = doc.css('.title-news')

  # # Duyệt qua từng mục tin tức và lấy thông tin
  # news_list.each do |news|
  #   # Lấy URL
  #   url = news.at_css('a')['href']

  #   # Lấy tiêu đề
  #   title = news.at_css('h3').text

  #   # Lấy mô tả
  #   description = news.at_css('p').text

  #   # In thông tin tin tức
  #   puts "URL: #{url}"
  #   puts "Tiêu đề: #{title}"
  #   puts "Mô tả: #{description}"
  #   puts '---'
  # end


