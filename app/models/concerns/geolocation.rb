module Geolocation
	extend ActiveSupport::Concern

	def geocode_conditionals(attribute)
		self.geocode if self.send("#{attribute}_changed?") || self.latitude.nil? || self.longitude.nil?
	end

end