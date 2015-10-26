class CruisesController < ApplicationController

	before_action :set_cruise, only: [:show]

	def index
		@cruises = Cruise.all
		@background_image = 'bg-water.jpg'
	end

	def show
	end

	private

	def set_cruise
		@cruise = Cruise.find(params[:id])
	end

end
