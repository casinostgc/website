class Admin::FlightsController < Admin::AdminController
	
	before_action :set_flight, only: [:edit, :update, :destroy]

	def index
		@flights = @flights_q.result(distinct: true).page(params[:page])
	end

	def import
		options = {erase: params[:erase]}
		Flight.import(params[:file], options)
		redirect_to admin_flights_url, notice: "Flights Imported."
	end

	def new
		@flight = Flight.new
	end

	def edit
	end

	def create
		@flight = Flight.new(flight_params)
		respond_to do |format|
			if @flight.save
				format.html { redirect_to edit_admin_flight_path(@flight), notice: 'Flight was successfully created.' }
				format.json { render :show, status: :created, location: @flight }
			else
				format.html { render :new }
				format.json { render json: @flight.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @flight.update(flight_params)
				format.html { redirect_to edit_admin_flight_path(@flight), notice: 'Flight was successfully updated.' }
				format.json { render :show, status: :ok, location: @flight }
			else
				format.html { render :edit }
				format.json { render json: @flight.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@flight.destroy
		respond_to do |format|
			format.html { redirect_to admin_flights_url, notice: 'Flight was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	def set_flight
		@flight = Flight.find(params[:id])
	end

	def flight_params
		params.require(:flight).permit(:departing_airport, :departing_at, :arriving_airport, :arriving_at, :flight_number)
	end
end
