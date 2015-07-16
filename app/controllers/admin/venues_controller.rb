class Admin::VenuesController < Admin::AdminController

	# include PictureBuilder

	before_action :set_venue, only: [:edit, :update, :destroy]

	# respond_to :html

	def index
		@venues = Venue.all.page(params[:page])
		@items = @venues
		render template: 'admin/admin/shared_index'
	end

	def new
		@venue = Venue.new
		# build_pictures @venue
		render :new_modal, layout: false if params[:modal].present?
	end

	def edit
		# build_pictures @venue
	end

	def create
		@venue = Venue.new(venue_params)
		@type = params[:event_type][0]
		
		respond_to do |format|
			if @venue.save
				format.html { redirect_to edit_admin_venue_path(@venue), notice: 'Venue was successfully created.' }
				format.json { render :show, status: :created, location: @venue }
				format.js { render :create, status: :created, location: @venue }
			else
				format.html { render :new }
				format.json { render json: @venue.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @venue.update(venue_params)
				format.html { redirect_to edit_admin_venue_path(@venue), notice: 'Venue was successfully updated.' }
				format.json { render :show, status: :ok, location: @venue }
			else
				format.html { render :edit }
				format.json { render json: @venue.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@venue.destroy
		respond_to do |format|
			format.html { redirect_to admin_venues_url, notice: 'Venue was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def set_venue
		@venue = Venue.friendly.find(params[:id])
	end

	def venue_params
		params.require(:venue).permit(:name, :address, :type, :content)
	end
end
