class Flight < ActiveRecord::Base

	require 'smarter_csv'
	require 'world_airports'

	after_save :update_airports, :update_destination

	serialize :arriving_location
	serialize :departing_location

	belongs_to :destination

	# default_scope { order(departing_at: :asc) }
	default_scope { where( "departing_at > ?", Time.now ).order(departing_at: :asc) }

	scope :available_destinations, -> { all.map(&:arriving_location).map(&:city).sort.uniq }

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file, options)
		options[:erase] ? Flight.destroy_all : nil
		SmarterCSV.process( file.path, {chunk_size: 1000} ) do |chunk|
			chunk.each do |data_hash|
				data_hash.delete(:destination)
				data_hash[:arriving_at] = Time.strptime(data_hash[:arriving_at], "%m/%d/%Y")
				data_hash[:departing_at] = Time.strptime(data_hash[:departing_at], "%m/%d/%Y")
				flight = Flight.create!(data_hash)
			end
		end
	end

	def update_airports
		self.update_column(:arriving_location, WorldAirports.iata(self.arriving_airport))
		self.update_column(:departing_location, WorldAirports.iata(self.departing_airport))
	end

	def update_destination
		destination = Destination.find_or_create_by!(name: "#{self.arriving_location.city}, #{self.arriving_location.country}") do |dest|
			# dest.location = "#{self.arriving_location.iata}, #{self.arriving_location.city}, #{self.arriving_location.country}"
		end
		self.update_column(:destination_id, destination.id)
	end

	ransacker :departing_at do
		Arel.sql('date(departing_at)')
	end

	
end
