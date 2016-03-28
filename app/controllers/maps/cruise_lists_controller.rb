class Maps::CruiseListsController < ApplicationController

	layout 'maps'

	before_action :set_cruise_list, only: [:show]

	def show
	end

	private

	def set_cruise_list
		@cruise_list = CruiseList.find(params[:id])
	end

end
