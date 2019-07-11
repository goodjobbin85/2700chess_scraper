require 'open-uri'
require 'nokogiri'
require 'csv'

url = "https://2700chess.com/"
page = Nokogiri::HTML(open(url))
#result = page.css('td.name')
#puts result.text

player_names = []
names = page.css('tr td.name a')
names.each do |name|
	player_names << name.text
end

player_ratings = []
ratings = page.css('tr td.live_standard_rating')
ratings.each { |rating| player_ratings << rating.text.strip }

player_countries = []
country = page.css('td[class="country f24"] span[class="hidden searched"]')
country.each do |country|
	player_countries << country.text
end

player_age = []
ages = page.css('td.age')
ages.each { |age| player_age << age.text }

name_rating_country = names.zip(ratings, country)
name_rating_country.each do |name, rating, country|
	puts "#{name.text}: #{rating.text} #{country.text}"
end

puts "#{names.count} chess players"
player_names.each { |name| puts name }
player_ratings.each { |rating| puts rating }
player_countries.each { |country| puts country }


#puts "There are #{result.count} chess players on this list"

#puts page.css('table[id="live-ratings-table"]')
#puts page.css('table#live-ratings-table')

#write data to csv file
CSV.open("player_listing.csv", "w") do |file|
	file << ["Player Name", "Player Rating", "Player Country", "Player Age"]

	player_names.size.times do |i|
		file << [player_names[i], player_ratings[i], player_countries[i], player_age[i]]
	end
end