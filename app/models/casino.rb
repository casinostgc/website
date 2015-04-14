class Casino < ActiveRecord::Base

	include Content
	include NestedPictures
	include Geolocation

	default_scope { includes(:casino_destinations).order(name: :asc) }
	scope :featured, -> { joins(:pictures).uniq.shuffle.sample(4) }
	
	has_many :casino_destinations, dependent: :destroy
	has_many :destinations, -> { uniq.select("destinations.*, casino_destinations.distance AS distance") }, through: :casino_destinations

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	geocoded_by :address
	after_validation { geocode_conditionals(:address) }

	after_validation :set_closest_destinations

	def set_closest_destinations
		Destination.near(self.address, 50, order: 'distance').each do |dest|
			CasinoDestination.find_or_create_by(casino: self, destination: dest) do |cd|
				cd.distance = dest.distance
			end
		end
	end

end
