class Admin::FlightsController < Admin::AdminController
	before_action :set_flight, only: [:edit, :update, :destroy]

	respond_to :html

	def index
		@flights = @flights_q.result(distinct: true).page(params[:page])
	end

	def import
		options = {erase: params[:erase]}
		Flight.import(params[:file], options)
		redirect_to admin_flights_url, notice: "Flights Imported."
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
		params.require(:flight).permit(:departing_airport, :departing_at, :arriving_airport, :arriving_at, :flight_number)
	end
end
