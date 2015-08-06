class Destination < ActiveRecord::Base

	# includes and requirements
	include Content
	include Geolocation
	include Imageable

	extend FriendlyId
	friendly_id :name, use: :slugged

	geocoded_by :name

	# assocations
	has_many :casinos
	has_many :flights, through: :casinos

	# scopes
	default_scope { includes(:casinos).order(name: :asc) }
	# scope :featured, -> { joins(:casinos).uniq.shuffle.sample(4) }

	# callbacks
	after_validation { geocode_conditionals(:name) }
	
	# class methods

	# instance methods

	# filters
	def should_generate_new_friendly_id?
		slug.blank?
	end

	# validations

end
