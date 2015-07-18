class Admin::DestinationsController < Admin::AdminController

	include ImageableBuilder

	before_action :set_destination, only: [:edit, :update, :destroy]

	respond_to :html

	def index
		@destinations = Destination.all.page(params[:page])
		@items = @destinations
		render template: 'admin/admin/shared_index'
	end

	def new
		@destination = Destination.new
		# build_pictures @destination
	end

	def edit
		# build_pictures @destination
	end

	def create
		@destination = Destination.new(destination_params)
		@destination.save
		respond_with(@destination)
	end

	def update
		@destination.update(destination_params)
		respond_with(@destination)
	end

	def destroy
		@destination.destroy
		redirect_to admin_destinations_url, notice: 'Destination was successfully destroyed.'
	end

	private
	def set_destination
		@destination = Destination.friendly.find(params[:id])
	end

	def destination_params
		params.require(:destination).permit(:name, :content, :location, :international, :latitude, :longitude)
	end
end