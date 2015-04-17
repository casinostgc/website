class Admin::AdminController < ApplicationController

	before_action :authenticate_user!
	before_action :authenticate_admin!

	layout 'admin'

	def index
	end

	def logs
		file = File.read("#{Rails.root}/log/production.log")
		render text: file
	end

	private

	def authenticate_admin!
		redirect_to new_user_session_path unless current_user.admin
	end

	

end