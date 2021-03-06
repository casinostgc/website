class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :set_ransacks

	def set_ransacks
		@flights_q = Flight.ordered.ransack(params[:q])
	end

end
