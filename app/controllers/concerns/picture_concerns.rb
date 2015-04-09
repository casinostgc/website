module PictureConcerns
	extend ActiveSupport::Concern

	included do
		# before_action :build_pictures, only: [:edit, :new]
	end

	def build_pictures(variable)
		1.times do
			variable.pictures.build
		end
	end

	def picture_params
		[:id, :name, :image, :imageable_id, :imageable_type, :_destroy]
	end

end