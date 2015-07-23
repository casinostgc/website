class PortOfCall < ActiveRecord::Base

	include DatetimeFormat

	default_scope { order(arrives_at: :asc) }
	
	belongs_to :cruise
	belongs_to :port

	def start_string
		convert_time_to_str(self.arrives_at)
	end

	def start_string=(time_str)
		self.arrives_at = convert_str_to_time(time_str)
	end

	def end_string
		convert_time_to_str(self.departs_at)
	end

	def end_string=(time_str)
		self.departs_at = convert_str_to_time(time_str)
	end

	def check_departure_date
		puts 'checking valid departure date'
		puts self.departs_at
		errors[:base] << ": Departure date must be greater than today." if self.departs_at <= Date.today
	end

	validate :check_departure_date

end
