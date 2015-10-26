class EventsController < ApplicationController

	before_action :set_event, only: [:show]

	def index
		# @events = @events_q.result.page(params[:page])
		@events = Event.all
		@background_image = 'bg-event.jpg'
	end

	def show
	end

	private
	
	def set_event
		@event = Event.find(params[:id])
	end

end
