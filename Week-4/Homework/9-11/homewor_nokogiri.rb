require 'faraday'
require 'nokogiri'

url = 'https://vnexpress.net/so-hoa/cong-nghe/ai'
response = Faraday.get(url)
doc = Nokogiri::HTML(response.body)

news_list = doc.css('.item-news')

news_list.each do |news|
  news_url = news.at_css('h2 a')['href'] if news.at_css('h2 a')
  news_title = news.at_css('h2 a').text.gsub("\n",'') if news.at_css('h2 a')
  news_description = news.at_css('p.description').text.gsub("\n",'') if news.at_css('p.description')

  puts "URL: #{news_url}" if news_url
  puts "Tiêu đề: #{news_title}" if news_title
  puts "Mô tả: #{news_description}" if news_description
  puts '<==================================================================================>'
end
