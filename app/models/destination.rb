class Destination < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		name_changed? || slug.blank?
	end

	include Content	

	geocoded_by :location
	after_validation :geocode, :if => :location_changed?
	
	has_many :casinos
	has_many :flights

end
