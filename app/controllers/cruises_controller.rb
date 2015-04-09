class CruisesController < ApplicationController
	before_action :set_cruise, only: [:show]

	respond_to :html

	def index
		@cruises = Cruise.all.page(params[:page])
		respond_with(@cruises)
	end

	def show
		respond_with(@cruise)
	end

	private
	def set_cruise
		@cruise = Cruise.find(params[:id])
	end

	def cruise_params
		params.require(:cruise).permit(:title, :slug, :content, :start_at, :end_at, :venue_id)
	end
end
