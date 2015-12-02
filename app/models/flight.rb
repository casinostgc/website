class Flight < ActiveRecord::Base

	# includes and requirements
	require 'smarter_csv'
	require 'world_airports'
	include DatetimeFormat
	datetime_vars start_var: :departing_at, end_var: :arriving_at

	serialize :departing_location

	ransacker :departing_at do
		Arel.sql('date(departing_at)')
	end

	# assocations
	belongs_to :casino

	# scopes
	default_scope { where( "departing_at > ?", Time.now ) }

	scope :unique_dates, -> {
		select("date(departing_at) AS departing_at_date").distinct
		.map(&:departing_at_date).sort
	}
	# scope :available_destinations, -> {
	# 	joins(casino: :destination)
	# 	.select("destinations.name AS destinaition_name").distinct
	# 	.map(&:destinaition_name).sort
	# }
	scope :departing_airports, -> {
		select(:departing_airport).distinct
		.map(&:select_departing_airport).sort
	}
	scope :available_destination_casinos, -> {
		joins(:casino)
		.select("casinos.name AS casinos_name", "casinos.code AS casinos_code").distinct
		.map{ |f| [f.casinos_name, f.casinos_code] }.sort
	}

	# callbacks
	before_save :update_airport_location

	# validations
	validates :departing_airport, :departing_at, :arriving_at, :casino_code, presence: true

	# class methods
	def self.import(file, options)
		options[:erase] ? Flight.destroy_all : nil
		SmarterCSV.process( file.path, {chunk_size: 1000} ) do |chunk|
			chunk.each do |data_hash|

				flight = Flight.new
				flight.departing_airport = data_hash[:departing_airport]
				flight.departing_at = self.flight_datetime_format( data_hash[:departing_at] )
				flight.arriving_at = self.flight_datetime_format( data_hash[:arriving_at] )
				flight.casino = assign_casino( data_hash[:casino_code] )

				flight.save!

			end
		end
	end

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end
		end
	end

	# instance methods
	def select_departing_airport
		["#{self.departing_airport.upcase} - #{WorldAirports.iata(self.departing_airport).name}", self.departing_airport]
	end

	def casino_code
		self.casino.code if self.casino.present?
	end

	def casino_code=(code)
		self.casino = assign_casino( code )
	end

	private

	def assign_casino(code)
		Casino.find_or_create_by(code: code) do |casino|
			casino.name = code
		end
	end

	def self.flight_datetime_format(time)
		Time.strptime( time, "%m/%d/%Y" )
	end

	def update_airport_location
		self.departing_location = WorldAirports.iata(self.departing_airport)
	end

end
