class EventsController < ApplicationController

	before_action :set_event, only: [:show]

	def index
		@events = type_class.all
	end

	def show
	end

	private

	def type_class
		Event.types.include?(params[:type]) ? params[:type].constantize : Event.only_events
	end

	def set_event
		@event = type_class.find(params[:id])
	end

	# def event_params
	# 	params.require(:event).permit(:title, :slug, :venue_id, :host, :start_at, :end_at, :type, :content)
	# end

end
