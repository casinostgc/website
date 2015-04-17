class Port < ActiveRecord::Base

	include NestedPictures
	include Geolocation

	has_many :port_of_calls
	has_many :cruises, through: :port_of_calls

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	geocoded_by :location
	after_validation { geocode_conditionals(:location) }

	validates :name, :location, presence: true

end
