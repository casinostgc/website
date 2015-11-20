class Attraction < ActiveRecord::Base

	include Content
	include Imageable

	has_many :venue_attractions, dependent: :destroy
	has_many :venues, through: :venue_attractions

	default_scope { order(name: :asc) }

end
