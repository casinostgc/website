class VenueAttraction < ActiveRecord::Base

	belongs_to :venue
	belongs_to :attraction

end
