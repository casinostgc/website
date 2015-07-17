class Venue < ActiveRecord::Base

	include Content
	include Geolocation
	include Imageable

	has_many :events
	has_many :cruises

	has_many :venue_attractions, dependent: :destroy
	has_many :attractions, through: :venue_attractions

	accepts_nested_attributes_for :venue_attractions, reject_if: proc { |attributes| attributes[:attraction_id].blank? }, allow_destroy: true

	delegate :cruises, :land_events, to: :events

	default_scope { order(name: :asc) }

	# scope :only_cruises, -> { where(cruise_line: true) }
	# scope :only_events, -> { where(cruise_line: false) }

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		slug.blank?
	end

	geocoded_by :address
	# after_validation { cruiseline_conditional(:address) }

	# def cruiseline_conditional(address)
	# 	geocode_conditionals(address) unless self.cruise_line
	# end

end