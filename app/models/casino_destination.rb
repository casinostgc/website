class CasinoDestination < ActiveRecord::Base

	# default_scope { order(distance: :asc) }

	belongs_to :casino
	belongs_to :destination


end
