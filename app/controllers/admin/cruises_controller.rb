class Admin::CruisesController < Admin::AdminController

	# include cruisesHelper

	include ImageableBuilder

	before_action :set_cruise, only: [:edit, :update, :destroy]
	before_action :set_nested_includes, only: [:new, :edit]

	def index
		@cruises = Cruise.all.page(params[:page])
	end

	def new
		@cruise = Cruise.new

		3.times do
			@cruise.port_of_calls.build
		end
	end

	def edit
		3.times do
			@cruise.port_of_calls.build if @cruise.port_of_calls.empty?
		end
	end

	def create
		@cruise = Cruise.new(cruise_params)

		respond_to do |format|
			if @cruise.save
				format.html { redirect_to edit_admin_cruise_path(@cruise), notice: 'Cruise was successfully created.' }
				format.json { render :show, status: :created, location: @cruise }
			else
				format.html { render :new }
				format.json { render json: @cruise.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @cruise.update(cruise_params)
				format.html { redirect_to edit_admin_cruise_path(@cruise), notice: 'Cruise was successfully updated.' }
				format.json { render :show, status: :ok, location: @cruise }
			else
				format.html { render :edit }
				format.json { render json: @cruise.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@cruise.destroy
		respond_to do |format|
			format.html { redirect_to admin_cruises_url, notice: 'cruise was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def set_cruise
		@cruise = Cruise.find(params[:id])
	end

	def set_nested_includes
		@nested_includes = []
		@nested_includes << :port_of_calls
	end

	def cruise_params
		params.require(:cruise).permit(:title, :venue_id, :start_string, :end_string, :content, pictures_attributes: picture_params, port_of_calls_attributes: [:id, :port_id, :start_string, :end_string, :_destroy])
	end

end
