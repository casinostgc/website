class PortOfCall < ActiveRecord::Base

	# include Datetimeformat

	default_scope { order(arrives_at: :asc) }
	
	belongs_to :cruise
	belongs_to :port

	def check_departure_date
		errors[:base] << ": Departure date must be greater than today." if self.departs_at <= Date.today
	end

	validate :check_departure_date

end
