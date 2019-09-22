class VenueAttraction < ActiveRecord::Base

	belongs_to :venue
	belongs_to :attraction

  default_scope { order(position: :asc) }

end
