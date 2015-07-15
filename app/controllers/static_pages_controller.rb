class StaticPagesController < ApplicationController

	layout 'pages'

	def index
		@events = Event.all
	end
	
end
