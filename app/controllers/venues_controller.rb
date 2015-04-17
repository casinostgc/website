class VenuesController < ApplicationController

	before_action :set_venue, only: [:show]

	respond_to :html

	def index
		@venues = Venue.all
		respond_with(@venues)
	end

	def show
		respond_with(@venue)
	end

	private

	def set_venue
		@venue = Venue.friendly.find(params[:id])
	end

end
