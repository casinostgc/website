class Admin::DestinationsController < Admin::AdminController

	include ImageableBuilder

	before_action :set_destination, only: [:edit, :update, :destroy]

	def index
		@destinations = Destination.all.page(params[:page])
		@items = @destinations
		render template: 'admin/admin/shared_index'
	end

	def new
		@destination = Destination.new
		@destination.pictures.build
	end

	def edit
		@destination.pictures.build
	end

	def create
		@destination = Destination.new(destination_params)
		respond_to do |format|
			if @destination.save
				format.html { redirect_to edit_admin_destination_path(@destination), notice: 'Destination was successfully created.' }
				format.json { render :show, status: :created, location: @destination }
			else
				format.html { render :new }
				format.json { render json: @destination.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @destination.update(destination_params)
				format.html { redirect_to edit_admin_destination_path(@destination), notice: 'Destination was successfully updated.' }
				format.json { render :show, status: :ok, location: @destination }
			else
				format.html { render :edit }
				format.json { render json: @destination.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@destination.destroy
		respond_to do |format|
			format.html { redirect_to admin_destinations_url, notice: 'destination was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	def set_destination
		@destination = Destination.friendly.find(params[:id])
	end

	def destination_params
		params.require(:destination).permit(:name, :slug, :content, :location, :international, :latitude, :longitude, pictures_attributes: picture_params)
	end
end