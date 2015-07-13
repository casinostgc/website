class EventsController < ApplicationController

	before_action :set_event, only: [:show]
	before_action :set_type

	def index
		@events = type_class.all
		@background_image = params[:type] == 'Cruise' ? 'bg-water.jpg' : 'bg-caesars-palace.jpg'
	end

	def show
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

	# def event_params
	# 	params.require(:event).permit(:title, :slug, :venue_id, :host, :start_at, :end_at, :type, :content)
	# end

end
