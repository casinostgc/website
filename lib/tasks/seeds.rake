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

end