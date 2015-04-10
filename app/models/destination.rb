class Destination < ActiveRecord::Base

	include Content
	include NestedPictures

	default_scope { order(name: :asc) }
	scope :featured, -> { joins(:pictures).uniq.shuffle.sample(4) }


	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	# after_validation :geocode, if: :location_changed?
	# geocoded_by :location
	
	# has_many :casinos, dependent: :destroy
	has_many :flights

end
