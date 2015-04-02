class Admin::FlightsController < Admin::AdminController
	before_action :set_flight, only: [:edit, :update, :destroy]

	respond_to :html

	def index
		@flights = Flight.all
	end

	def import
		options = {}
		results = SmarterCSV.process( params[:file].path, options )
		params[:erase] ? Flight.destroy_all : nil
		results.each do |row|
			row = row.to_hash
			if row[:destination_id].is_a? Integer
				finder = Destination.find(row[:destination_id]).id
			else
				finder = Destination.friendly.find(row[:destination_id].parameterize).id
			end
			row[:destination_id] = finder
			if Flight.find_by_id(row[:id])
				Flight.update(row[:id], row)
			else
				Flight.create!(row)
			end
		end
		redirect_to flights_url, notice: "Flights Imported."
	end

	def new
		@flight = Flight.new
		respond_with(@flight)
	end

	def edit
	end

	def create
		@flight = Flight.new(flight_params)
		@flight.save
		respond_with(@flight)
	end

	def update
		@flight.update(flight_params)
		respond_with(@flight)
	end

	def destroy
		@flight.destroy
		respond_with(@flight)
	end

	private
	def set_flight
		@flight = Flight.find(params[:id])
	end

	def flight_params
		params.require(:flight).permit(:destination_id, :departing_location, :departing_at, :arriving_location, :arriving_at, :flight_number)
	end
end
