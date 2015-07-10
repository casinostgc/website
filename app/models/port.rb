class Port < ActiveRecord::Base

	# include NestedPictures
	include Geolocation

	# has_many :port_of_calls
	# has_many :cruises, through: :port_of_calls

	default_scope { order(name: :asc) }

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	geocoded_by :name
	after_validation { geocode_conditionals(:name) }

	validates :name, presence: true

end
