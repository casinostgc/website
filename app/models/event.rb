class Event < ActiveRecord::Base

	include Content
	include Imageable
	# include Datetimeformat
	
	default_scope { includes(:venue).where("DATE(start_at) > ?", Date.today ).order(start_at: :asc) }

	belongs_to :venue

	validates :venue_id, presence: true

	def date_span
		self.start_at.strftime("%b %d, %Y") + ' - ' + self.end_at.strftime("%b %d, %Y")
	end

	def icon
		case type
		when 'Cruise'
			'ship'
		else
			'calendar'
		end
	end

	class << self
		def types
			%w(Cruise LandEvent)
		end
	end
	
end

class LandEvent < Event; end;