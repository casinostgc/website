class Admin::PortsController < Admin::AdminController

	before_action :set_port, only: [:edit, :update, :destroy]

	respond_to :html

	def index
		@ports = Port.all
		respond_with(@ports)
	end

	def new
		@port = Port.new
		respond_with(@port)
	end

	def edit
	end

	def create
		@port = Port.new(port_params)
		@port.save
		respond_with(@port)
	end

	def update
		@port.update(port_params)
		respond_with(@port)
	end

	def destroy
		@port.destroy
		respond_with(@port)
	end

	private

	def set_port
		@port = Port.find(params[:id])
	end

	def port_params
		params.require(:port).permit(:name, :content, :location, :latitude, :longitude)
	end

end
