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
puts "#{names.count} chess players"
#puts "There are #{result.count} chess players on this list"

#puts page.css('table[id="live-ratings-table"]')
#puts page.css('table#live-ratings-table')