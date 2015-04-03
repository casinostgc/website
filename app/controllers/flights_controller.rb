class FlightsController < ApplicationController
	before_action :set_flight, only: [:show]

	respond_to :html

	def index
		@flights = @flights_q.result(distinct: true).page(params[:page])
	end

	def show
	end

	private
	def set_flight
		@flight = Flight.find(params[:id])
	end

	def flight_params
		params.require(:flight).permit(:destination_id, :departing_location, :departing_at, :arriving_location, :arriving_at, :flight_number)
	end
end
