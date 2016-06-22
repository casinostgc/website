class PortOfCall < ActiveRecord::Base

	include DatetimeFormat
	datetime_vars start_var: :arrives_at, end_var: :departs_at

	default_scope { order(departs_at: :asc) }

	belongs_to :cruise, inverse_of: :port_of_calls
	belongs_to :port, inverse_of: :port_of_calls

	validate :check_dates

	before_save :validate_one_featured_port

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

	private

	def validate_one_featured_port
		PortOfCall.where.not(id: id).where(cruise: cruise).update_all(featured: false) if featured == true && featured_changed?
	end

end
