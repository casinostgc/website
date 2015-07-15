class Destination < ActiveRecord::Base

	# includes and requirements
	include Content
	include Geolocation

	extend FriendlyId
	friendly_id :name, use: :slugged

	geocoded_by :name

	# assocations
	has_many :casinos
	has_many :flights

	# scopes
	default_scope { order(name: :asc) }
	# default_scope { includes(:casino_destinations).order(name: :asc) }
	# scope :featured, -> { joins(:casinos).uniq.shuffle.sample(4) }

	# callbacks
	after_validation { geocode_conditionals(:name) }
	
	# class methods

	# instance methods
	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	# filters

	# validations

end
