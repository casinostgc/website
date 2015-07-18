class FlightsController < ApplicationController
	
	before_action :set_flight, only: [:show, :edit, :update, :destroy]

	def index
		@flights = @flights_q.result.page(params[:page])
	end

	def show
	end

	private
	
	def set_flight
		@flight = Flight.find(params[:id])
	end

end
