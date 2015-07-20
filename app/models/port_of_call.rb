class PortOfCall < ActiveRecord::Base

	include DatetimeFormat

	default_scope { order(arrives_at: :asc) }
	
	belongs_to :cruise
	belongs_to :port

	after_initialize :convert_datetimes

	# def start_time
	# 	persisted? ? convert_time_to_str(self.departs_at)
	# end

	# def end_time
	# 	persisted? ? convert_time_to_str(self.arrives_at)
	# end

	def convert_times
		puts "poc times:"
		puts "#{self.departs_at}, #{self.arrives_at}"
		# self.departs_at = convert_str_to_time(self.departs_at)
		# self.arrives_at = convert_str_to_time(self.arrives_at)
	end

	def convert_datetimes
		self.departs_at = 'hello'
		self.arrives_at = 'hello'
	end

	def check_departure_date
		puts 'checking valid departure date'
		errors[:base] << ": Departure date must be greater than today." if self.departs_at <= Date.today
	end

	# validate :check_departure_date

end
