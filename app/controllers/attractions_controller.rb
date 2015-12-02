class AttractionsController < ApplicationController

	before_action :set_attraction, only: [:show]
	before_action :set_venue

	def index
		@attractions = @venue.present? ? @venue.attractions : Attraction.all
		render :index, layout: false
	end

	def show
	end

	private

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end

	def set_venue
		@venue = Venue.friendly.find(params[:venue_id]) if params[:venue_id].present?
	end

end
