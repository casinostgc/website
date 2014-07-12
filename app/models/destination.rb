class Destination < ActiveRecord::Base

	# include SharedMethods

	extend FriendlyId
	friendly_id :name, use: :slugged
	def should_generate_new_friendly_id?
		name_changed?
	end

	geocoded_by :location
	after_validation :geocode, :if => :location_changed?
	
	has_many :casinos
	has_many :flights

end
