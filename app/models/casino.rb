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
	has_many :flights, dependent: :destroy
	
	# scopes
	default_scope { order(name: :asc) }
	# scope :featured, -> { uniq.shuffle.sample(4) }

	# callbacks
	before_validation :require_name_from_code
	after_validation { geocode_conditionals(:address) }


	# after_validation :assign_destination

	# class methods

	# instance methods

	# filters
	def should_generate_new_friendly_id?
		slug.blank?
	end

	def require_name_from_code
		unless self.name.present?
			self.name = self.code
			self.slug = self.code
		end
	end

	# def assign_destination
	# 	self.destination = Destination.near(self.address, 50, order: 'distance').first
	# end

	# validations
	validates :code, presence: true

end
