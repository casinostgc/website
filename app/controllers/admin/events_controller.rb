class Admin::EventsController < Admin::AdminController

	include EventsHelper

	include ImageableBuilder

	before_action :set_event, only: [:edit, :update, :destroy]
	before_action :set_nested_includes, only: [:new, :edit]

	def index
		@events = Event.all.page(params[:page])
	end

	def new
		@event = Event.new

		@event.pictures.build
	end

	def edit
		@event.pictures.build
	end

	def create
		@event = Event.new(event_params)

		respond_to do |format|
			if @event.save
				format.html { redirect_to edit_admin_event_path(@event), notice: 'Event was successfully created.' }
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
				format.html { redirect_to edit_admin_event_path(@event), notice: 'Event was successfully updated.' }
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

	def set_event
		@event = Event.find(params[:id])
	end

	def set_nested_includes
		@nested_includes = []
		@nested_includes << :pictures
	end

	def event_params
		params.require(:event).permit(:title, :casino_id, :start_string, :end_string, :content, pictures_attributes: picture_params)
	end

end
