class PortOfCall < ActiveRecord::Base

	include Datetimeformat

	default_scope { order(arrives_at: :asc) }

	belongs_to :cruise
	belongs_to :port

	def arrives_at=(date)
		date_time_picker_format(date)
	end

	def departs_at=(date)
		date_time_picker_format(date)
	end

end
