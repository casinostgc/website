class CasinosController < ApplicationController

	before_action :set_casino, only: [:show, :edit, :update, :destroy]
	before_action :set_destination, only: [:index]

	def index
		@casinos = @destination.present? ? @destination.casinos : Casino.all
	end

	def show
	end

	private

	def set_casino
		@casino = Casino.friendly.find(params[:id])
	end

	def set_destination
		@destination = Destination.friendly.find(params[:destination_id]) if params[:destination_id].present?
	end

end
