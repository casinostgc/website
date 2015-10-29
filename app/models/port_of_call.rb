class PortOfCall < ActiveRecord::Base

	include DatetimeFormat
	datetime_vars start_var: :arrives_at, end_var: :departs_at

	default_scope { order(departs_at: :asc) }
	
	belongs_to :cruise
	belongs_to :port

	validates :departs_at, :arrives_at, presence: { message: 'must be present. Go back to edit.' }
	# validate :check_dates

	# def check_dates
	# 	arrives_at = departs_at if arrives_at.nil?
	# 	departs_at = arrives_at if departs_at.nil?
	# end

end
