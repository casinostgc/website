require 'nokogiri'
require 'open-uri'

namespace :ports do

	task import: :environment do
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