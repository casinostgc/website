class PortOfCall < ActiveRecord::Base

	# include Datetimeformat

	default_scope { order(arrives_at: :asc) }
	
	belongs_to :cruise
	belongs_to :port


end
