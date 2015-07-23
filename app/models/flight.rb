class Flight < ActiveRecord::Base

	# includes and requirements
	require 'smarter_csv'
	require 'world_airports'
	include DatetimeFormat

	serialize :arriving_location
	serialize :departing_location

	ransacker :departing_at do
		Arel.sql('date(departing_at)')
	end

	# assocations
	belongs_to :destination

	# scopes
	default_scope { where( "departing_at > ?", Time.now ) }
	
	scope :unique_dates, -> {
		select("date(departing_at) AS departing_at_date").distinct
		.map(&:departing_at_date).sort
	}
	scope :available_destinations, -> { 
		joins(:destination)
		.select("destinations.name AS destinaition_name").distinct
		.map(&:destinaition_name).sort
	}
	scope :departing_airports, -> {
		select(:departing_airport).distinct
		.map(&:select_departing_airport).sort
	}

	# callbacks
	after_save :update_airports, :update_destination

	# class methods
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

				# flight = Flight.new
				# flight.arriving_at = data_hash[:arriving_at]
				# flight.departing_at = data_hash[:departing_at]
				# flight.departing_airport = data_hash[:departing_airport]
				# flight.arriving_airport = data_hash[:arriving_airport]
				# flight.flight_num = data_hash[:flight_num]
				# flight.save

				data_hash.delete(:destination)
				data_hash[:arriving_at] = Time.strptime(data_hash[:arriving_at], "%m/%d/%Y")
				data_hash[:departing_at] = Time.strptime(data_hash[:departing_at], "%m/%d/%Y")
				flight = Flight.create!(data_hash)
			end
		end
	end

	# instance methods
	def select_departing_airport
		["#{self.departing_airport.upcase} - #{WorldAirports.iata(self.departing_airport).name}", self.departing_airport]
	end

	def start_string
		convert_time_to_str(self.departing_at)
	end

	def start_string=(time_str)
		self.departing_at = convert_str_to_time(time_str)
	end

	def end_string
		convert_time_to_str(self.arriving_at)
	end

	def end_string=(time_str)
		self.arriving_at = convert_str_to_time(time_str)
	end

	# filters
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

	# validations

end
