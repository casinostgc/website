class PortOfCall < ActiveRecord::Base

	include DatetimeFormat
	datetime_vars start_var: :arrives_at, end_var: :departs_at

	default_scope { order(departs_at: :asc) }
	
	belongs_to :cruise
	belongs_to :port

	validate :check_dates


	def check_dates
		if self.departs_at.nil? && self.arrives_at.nil?
			errors[:dates] << "must have at least a Departing OR Arriving time"
		else
			unless self.persisted?
				self.arrives_at = self.departs_at if self.arrives_at.nil?
				self.departs_at = self.arrives_at if self.departs_at.nil?
			else
				self.update_column(:arrives_at, self.departs_at) if arrives_at.nil?
				self.update_column(:departs_at, self.arrives_at) if departs_at.nil?
			end
		end
	end

end
