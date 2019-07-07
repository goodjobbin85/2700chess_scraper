require 'open-uri'
require 'nokogiri'

url = "https://2700chess.com/"
page = Nokogiri::HTML(open(url))
#result = page.css('td.name')
#puts result.text

names = page.css('tr td.name a')
names.each do |name|
	puts name.text
end

ratings = page.css('tr td.live_standard_rating')

country = page.css('td[class="country f24"] span[class="hidden searched"]')
country.each do |country|
	puts country.text
end

name_rating_country = names.zip(ratings, country)
name_rating_country.each do |name, rating, country|
	puts "#{name.text}: #{rating.text} #{country.text}"
end

puts "#{names.count} chess players"



#puts "There are #{result.count} chess players on this list"

#puts page.css('table[id="live-ratings-table"]')
#puts page.css('table#live-ratings-table')