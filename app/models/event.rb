class Event < ActiveRecord::Base

	include Content
	include Datetimeformat
	include NestedPictures
	
	default_scope { where("DATE(start_at) > ?", Date.today ).order(start_at: :asc) }

	belongs_to :venue
	# has_many :categories, through: :categorizations

end
