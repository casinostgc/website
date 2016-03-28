class CruiseListPort < ActiveRecord::Base

	belongs_to :cruise_list
	belongs_to :port

	default_scope { order(position: :asc) }

end
