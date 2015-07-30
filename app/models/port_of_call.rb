class PortOfCall < ActiveRecord::Base

	include DatetimeFormat
	datetime_vars start_var: :arrives_at, end_var: :departs_at

	default_scope { order(arrives_at: :asc) }
	
	belongs_to :cruise
	belongs_to :port

	validate :check_departure_date

	def check_departure_date
		puts 'checking valid departure date'
		puts self.departs_at
		errors[:base] << ": Departure date must be greater than today." if self.departs_at <= Date.today
	end

end
