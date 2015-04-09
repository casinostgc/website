class Admin::CruisesController < Admin::AdminController
	before_action :set_cruise, only: [:edit, :update, :destroy]

	respond_to :html

	def index
		@cruises = Cruise.all
		respond_with(@cruises)
	end

	def new
		@cruise = Cruise.new
		2.times do
			@cruise.port_of_calls.build
		end
		respond_with(@cruise)
	end

	def edit
	end

	def create
		@cruise = Cruise.new(date_params)
		@cruise.save
		respond_with(@cruise)
	end

	def update
		@cruise.update(cruise_params)
		respond_with(@cruise)
	end

	def destroy
		@cruise.destroy
		redirect_to admin_cruises_path
	end

	private
	def set_cruise
		@cruise = Cruise.find(params[:id])
	end

	def cruise_params
		params.require(:cruise).permit(:title, :content, :start_at, :end_at, :venue_id, port_of_calls_attributes: [:id, :port_id, :arrives_at, :departs_at, :_destroy])
	end
end
