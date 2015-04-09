class Picture < ActiveRecord::Base

	belongs_to :imageable, polymorphic: true
	# attr_accessible :image, :imageable_id, :imageable_type
	mount_uploader :image, ImageUploader

end
