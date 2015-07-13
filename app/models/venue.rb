class Venue < ActiveRecord::Base

	include Content
	include Geolocation
	include Imageable

	has_many :events
	has_many :cruises

	delegate :cruises, to: :events

	default_scope { order(name: :asc) }

	# scope :only_cruises, -> { where(cruise_line: true) }
	# scope :only_events, -> { where(cruise_line: false) }

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	geocoded_by :address
	# after_validation { cruiseline_conditional(:address) }

	# def cruiseline_conditional(address)
	# 	geocode_conditionals(address) unless self.cruise_line
	# end

end

# class VenueCruiseLine < Venue; end