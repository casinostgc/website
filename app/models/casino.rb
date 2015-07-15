class Casino < ActiveRecord::Base

	include Content
	include Geolocation
	# include NestedPictures
	
	belongs_to :destination

	default_scope { order(name: :asc) }
	# scope :featured, -> { uniq.shuffle.sample(4) }

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	geocoded_by :address
	after_validation { geocode_conditionals(:address) }

	after_validation :assign_destination

	def assign_destination
		self.destination = Destination.near(self.address, 50, order: 'distance').first
	end

end
