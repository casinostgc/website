class CasinosController < ApplicationController

	before_action :set_casino, only: [:show, :edit, :update, :destroy]

	def index
		@casinos_q = Casino.ransack(params[:q])
		@casinos = @casinos_q.result
	end

	def show
	end

	private

	def set_casino
		@casino = Casino.friendly.find(params[:id])
	end

end
