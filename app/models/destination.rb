class Destination < ActiveRecord::Base

	include Content
	include NestedPictures
	include Geolocation

	default_scope { includes(:casino_destinations).order(name: :asc) }
	scope :featured, -> { joins(:pictures, :casinos).uniq.shuffle.sample(4) }
	
	has_many :casino_destinations, dependent: :destroy
	has_many :casinos, -> { uniq.select("casinos.*, casino_destinations.distance AS distance") }, through: :casino_destinations
	has_many :flights, dependent: :destroy

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	geocoded_by :location
	after_validation { geocode_conditionals(:location) }
	
end
