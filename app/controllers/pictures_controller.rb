class PicturesController < ApplicationController

	before_action :set_picture, only: [:show, :edit, :update, :destroy]

	def index
		if parent_object
			# @pictures = Picture.where(imageable: parent_object)
			@pictures = parent_object.all_pictures
			render :index, layout: false
		else
			@pictures = Picture.all
		end
	end

	def show
	end

	private

	def parent_object
		request_vars = request.path.split('/')[1, 2]
		klass = request_vars[0].underscore.classify.constantize
		parent = request_vars[1].to_i != 0 ? klass.find(request_vars[1].to_i) : klass.friendly.find(request_vars[1])
	rescue
		false
	end

	def set_picture
		@picture = Picture.find(params[:id])
	end

end
