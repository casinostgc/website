require 'nokogiri'
require 'open-uri'

namespace :import do

	task cruises: :environment do
		@promo_cruises = JSON.parse File.read("#{Rails.root}/lib/assets/promo-cruises.json"), object_class: OpenStruct
		import_cruise_log = File.open("#{Rails.root}/log/import_cruise.log", "a+")

		@promo_cruises.each do |p_cruise|

			content_str = "<p>Price per Person: $#{p_cruise.per_person}</p>"
			content_str += "<p>Reference ##{p_cruise.number}</p>"
			content_str += "<p><em>CRUISE ONLY</em></p>" if p_cruise.cruise_only == 1

			@cruise = Cruise.new(title: "#{p_cruise.days} Days #{p_cruise.highlights}", content: content_str)

			# ship
			@cruise.venue = Venue.find_or_create_by(name: p_cruise.ship) do |ship|
				import_cruise_log << "Created Ship (Venue) #{ship.name}\n"
			end

			# ports
			unless port_to = Port.where("name LIKE ?", "%#{p_cruise.to}%").take
				port_to = Port.find_or_create_by(name: p_cruise.to) do |port|
					import_cruise_log << "Created Port #{port.name}\n"
				end
			end

			unless port_from = Port.where("name LIKE ?", "%#{p_cruise.from}%").take
				port_to = Port.find_or_create_by(name: p_cruise.from) do |port|
					import_cruise_log << "Created Port #{port.name}\n"
				end
			end

			@cruise.port_of_calls.new(port: port_to, departs_at: Date.strptime(p_cruise.embarkation, '%m/%d/%Y'), position: 0)
			@cruise.port_of_calls.new(port: port_from, arrives_at: Date.strptime(p_cruise.debarkation, '%m/%d/%Y'), position: 1)

			@cruise.save

		end if true
	end

	# existing cruise ids: [24, 30, 31, 25, 27, 28, 29]

end
