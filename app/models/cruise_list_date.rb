class CruiseListDate < ActiveRecord::Base

	include DatetimeFormat

	belongs_to :cruise_list

	default_scope { where( "departs_at > ?", Time.now ).order(departs_at: :asc) }

	def departure_date
		departs_at.try(:strftime, '%m/%d/%Y %I:%M %p')
	end

	def departure_date=(time_str)
		self.departs_at = convert_str_to_time(time_str)
	end

end
