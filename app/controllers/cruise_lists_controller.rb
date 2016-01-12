class CruiseListsController < ApplicationController

	before_action :set_cruise_list, except: [:index, :new, :create]

	def index
		@cruise_lists = CruiseList.all
		@background_image = 'bg-water.jpg'
		redirect_to cruises_path
	end

	def show
	end

	private

	def set_cruise_list
		@cruise_list = CruiseList.find(params[:id])
	end

end
