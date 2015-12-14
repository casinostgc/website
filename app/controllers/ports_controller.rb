class PortsController < ApplicationController

	before_action :set_port, only: [:show, :edit, :update, :destroy]

	def index
		@ports = Port.all
	end

	def show
		render :show, layout: false if params[:modal]
	end

	private

	def set_port
		@port = Port.friendly.find(params[:id])
	end

end
