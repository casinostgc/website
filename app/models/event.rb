class Event < ActiveRecord::Base

	include Content
	include Imageable
	include DatetimeFormat
	
	default_scope { includes(:venue).where("DATE(start_at) > ?", Date.today ).order(start_at: :asc) }

	belongs_to :venue

	validates :venue_id, presence: true

	def start_string
		convert_time_to_str(self.start_at)
	end

	def start_string=(time_str)
		self.start_at = convert_str_to_time(time_str)
	end

	def end_string
		convert_time_to_str(self.end_at)
	end

	def end_string=(time_str)
		self.end_at = convert_str_to_time(time_str)
	end

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
			%w(LandEvent Cruise)
		end
	end
	
end