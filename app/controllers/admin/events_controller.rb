class Admin::EventsController < Admin::AdminController

	include EventsHelper

	include ImageableBuilder

	before_action :set_event, only: [:edit, :update, :destroy]
	before_action :set_type
	before_action :set_nested_includes, only: [:new, :edit]

	def index
		@events = type_class.all
	end

	def new
		@event = type_class.new

		@event.pictures.build unless type == 'Cruise'

		2.times do
			@event.port_of_calls.build if type == 'Cruise'
		end
	end

	def edit
		@event.pictures.build unless type == 'Cruise'

		3.times do
			@event.port_of_calls.build if type == 'Cruise' && @event.port_of_calls.empty?
		end
	end

	def create
		@event = type_class.new(event_params)

		respond_to do |format|
			if @event.save
				format.html { redirect_to sti_event_path(@event.type, @event, :edit), notice: 'Event was successfully created.' }
				format.json { render :show, status: :created, location: @event }
			else
				format.html { render :new }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @event.update(event_params)
				format.html { redirect_to sti_event_path(@event.type, @event, :edit), notice: 'Event was successfully updated.' }
				format.json { render :show, status: :ok, location: @event }
			else
				format.html { render :edit }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@event.destroy
		respond_to do |format|
			format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def type
		Event.types.include?(params[:type]) ? params[:type] : "Event"
	end

	def type_class
		type.constantize
	end

	def set_type
		@type = type
	end

	def set_event
		@event = type_class.find(params[:id])
	end

	def set_nested_includes
		@nested_includes = []
		@nested_includes << :pictures unless type == 'Cruise'
		@nested_includes << :port_of_calls if type == 'Cruise'
	end

	def event_params
		params.require(type.underscore.to_sym).permit(:type, :title, :venue_id, :start_string, :end_string, :content, pictures_attributes: picture_params, port_of_calls_attributes: [:id, :port_id, :start_string, :end_string, :_destroy])
	end

end
