class EventsController < ApplicationController
	before_action :set_event, except: [:index]

	def index
		@events = Event.all
	end

	def show
	end

	private
	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:title, :slug, :content, :start_at, :end_at, :venue_id, :image_id)
	end
end
