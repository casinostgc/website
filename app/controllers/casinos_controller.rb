class CasinosController < ApplicationController
	
	before_action :set_casino, only: [:show]


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
