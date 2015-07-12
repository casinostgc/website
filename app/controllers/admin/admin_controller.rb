class Admin::AdminController < ApplicationController

	before_action :authenticate_user!
	before_action :authenticate_admin!

	layout 'admin'

	def index
		redirect_to admin_pages_path
	end

	private

	def authenticate_admin!
		redirect_to new_user_session_path unless current_user.admin
	end

end