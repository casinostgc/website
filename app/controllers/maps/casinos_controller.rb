class Maps::CasinosController < ApplicationController

	layout 'maps'

	before_action :set_casino, only: [:show]
	# before_action :set_destination, only: [:index]

	def index
		@casinos = Casino.all
	end

	def show
	end

	private

	def set_casino
		@casino = Casino.friendly.find(params[:id])
	end

end
