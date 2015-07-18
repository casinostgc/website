class DestinationsController < ApplicationController

	before_action :set_destination, only: [:show, :edit, :update, :destroy]

	def index
		@destinations = Destination.page(params[:Page])
	end

	def show
	end

	private

	def set_destination
		@destination = Destination.friendly.find(params[:id])
	end

end
