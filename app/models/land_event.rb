class LandEvent < Event

	include Imageable

	# scope :has_image, -> {
	# 	includes(venue: :pictures).where.not(pictures: {imageable: nil})
	# }

end