class Casino < ActiveRecord::Base

	# includes and requirements
	include Content
	include Geolocation
	include Imageable

	extend FriendlyId
	friendly_id :name, use: :slugged

	geocoded_by :address

	# assocations
	belongs_to :destination
	
	# scopes
	default_scope { order(name: :asc) }
	# scope :featured, -> { uniq.shuffle.sample(4) }

	# callbacks
	after_validation { geocode_conditionals(:address) }

	after_validation :assign_destination

	# class methods

	# instance methods

	# filters
	def should_generate_new_friendly_id?
		slug.blank?
	end

	def assign_destination
		self.destination = Destination.near(self.address, 50, order: 'distance').first
	end

	# validations
	

end
