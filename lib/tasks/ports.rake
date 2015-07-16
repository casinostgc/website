require 'nokogiri'
require 'open-uri'

namespace :seed do

	task ports: :environment do
		Port.destroy_all
		create_arr = []
		json = ActiveSupport::JSON.decode(File.read( Rails.root.join('db', 'seed_data', 'ports.json') ))
		json.each do |port|
			create_arr << {
				name: port['name'],
				slug: port['slug'],
				location: port['location'],
				content: port['content'],
				latitude: port['latitude'],
				longitude: port['longitude']
			}
		end
		Port.create!(create_arr)
	end

	task ports_from_word: :environment do
		doc = Nokogiri::HTML(open("http://localhost:4000/ports.html"))
		create_arr = []
		doc.css('table').each do |table|
			name = table.css('.s1').text
			content = ''
			table.css('.s2').each do |c|
				content << c.text
			end
			create_arr << {
				name: name,
				content: content
			}
		end
		Port.create(create_arr)
	end

end