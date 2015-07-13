module Imageable
	extend ActiveSupport::Concern

	included do
		has_many :pictures, as: :imageable
		# accepts_nested_attributes_for :pictures, allow_destroy: true
		accepts_nested_attributes_for :pictures, reject_if: proc { |attributes| attributes[:title].blank? }, allow_destroy: true
	
		scope :has_image, -> { joins(:pictures) }
	end


	# def first_image(size = nil)
	# 	self.pictures.first.image_url(size) if self.pictures.any?
	# end

end