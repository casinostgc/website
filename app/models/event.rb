class Event < ActiveRecord::Base

	include Content
	include NestedPictures
	
	default_scope { where("DATE(start_at) > ?", Date.today ).order(start_at: :asc) }

	# belongs_to :venue
	# has_many :categories, through: :categorizations
	
	has_many :pictures, as: :imageable
	accepts_nested_attributes_for :pictures


	def date_span
		self.start_at.strftime("%b %d, %Y") + ' - ' + self.end_at.strftime("%b %d, %Y")
	end

end
