class Admin::AdminController < ApplicationController

	# before_action :authenticate_user!
	# before_action :authenticate_admin

	layout 'admin'

	def index
		# @charges = Stripe::Charge.all(:limit => 20)
	end

	# def users
	# 	@users = nil
	# end

end