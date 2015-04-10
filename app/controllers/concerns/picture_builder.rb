module PictureBuilder
	extend ActiveSupport::Concern

	included do
		
	end

	def build_pictures(instance)
		1.times do
			instance.pictures.build
		end
	end

	def picture_params
		[:id, :name, :image, :imageable_id, :imageable_type, :_destroy]
	end

end