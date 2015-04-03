class DestinationsController < ApplicationController
	before_action :set_destination, except: [:index]

	def index
		@destinations = Destination.all.page(params[:page])
	end

	def show
	end

	private
	def set_destination
		@destination = Destination.friendly.find(params[:id])
	end
	
end
