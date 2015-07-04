class Admin::EventsController < Admin::AdminController

	# include PictureBuilder

	before_action :set_event, only: [:edit, :update, :destroy]

	respond_to :html

	def index
		@events = Event.all.page(params[:page])
	end

	def new
		@event = Event.new
		build_pictures @event
	end

	def edit
		build_pictures @event
	end

	def create
		@event = Event.new(event_params)
		@event.save
		respond_with(@event)
	end

	def update
		@event.update(event_params)
		respond_with(@event)
	end

	def destroy
		@event.destroy
		redirect_to events_url, notice: 'Event was successfully destroyed.'
	end

	private
	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:title, :content, :start_at, :end_at, :venue_id, :image_id)
	end
end
