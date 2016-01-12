class Maps::DestinationsController < ApplicationController

	layout 'maps'

	before_action :set_destination, only: [:show]

	def show
	end

	private

	def set_destination
		@destination = Destination.friendly.find(params[:id])
	end

end
