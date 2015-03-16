class SitePagesController < ApplicationController

	def index
		@events = Event.limit(3)
	end

end
