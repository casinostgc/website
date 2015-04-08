class PortsController < ApplicationController
	
	before_action :set_port, only: [:show]

	respond_to :html

	def index
		@ports = Port.all
		respond_with(@ports)
	end

	def show
		respond_with(@port)
	end

	private

	def set_port
		@port = Port.find(params[:id])
	end

end
