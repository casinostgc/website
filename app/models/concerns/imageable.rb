module Imageable
	extend ActiveSupport::Concern

	included do
		has_many :pictures, as: :imageable
		accepts_nested_attributes_for :pictures, reject_if: :should_reject, allow_destroy: true

		scope :has_image, -> { joins(:pictures).distinct }
	end

	# def first_image(size = nil)
	# 	self.pictures.first.image_url(size) if self.pictures.any?
	# end

	def should_reject(attributes)
		if attributes[:id].present?
			return false
		elsif attributes[:image].blank?
			return true
		else
			return false
		end
	end

end