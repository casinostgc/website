class Admin::DestinationsController < Admin::AdminController
	before_action :set_destination, only: [:edit, :update, :destroy]

	def index
		@destinations = Destination.all.page(params[:page])
	end

	def new
		@destination = Destination.new
	end

	def edit
	end

	def create
		@destination = Destination.new(destination_params)

		respond_to do |format|
			if @destination.save
				format.html { redirect_to admin_destinations_path, notice: 'Destination was successfully created.' }
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
				format.html { redirect_to admin_destinations_path, notice: 'Destination was successfully updated.' }
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
			format.html { redirect_to admin_destinations_url, notice: 'Destination was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	def set_destination
		@destination = Destination.friendly.find(params[:id])
	end

	def destination_params
		params.require(:destination).permit(:name, :content, :location, :international, :latitude, :longitude)
	end
end