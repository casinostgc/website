class Maps::CruisesController < ApplicationController

	layout 'maps'

	before_action :set_cruise, only: [:show]

	def show
	end

	private

	def set_cruise
		@cruise = Cruise.find(params[:id])
	end

end
