# frozen_string_literal: true

require 'faraday'
require 'nokogiri'

url = 'https://vnexpress.net/so-hoa/cong-nghe/ai'
response = Faraday.get(url)
doc = Nokogiri::HTML(response.body)

doc.css('nav ul.menu li a', 'article h2 a', 'article p').each do |link|
  puts link.content
  puts link['href']
end
