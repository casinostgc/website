class Cruise < Event

	# includes and requirements
	include Imageable

	# assocations
	has_many :port_of_calls, foreign_key: 'event_id'
	has_many :ports, through: :port_of_calls

	accepts_nested_attributes_for :port_of_calls, reject_if: proc { |attributes| attributes['port_id'].blank? }, allow_destroy: true

	# scopes
	default_scope { includes(:port_of_calls).where("DATE(start_at) > ?", Date.today ).order(start_at: :asc) }

	# scope :has_image, -> { joins(ports: :pictures).distinct }
	scope :has_image, -> {
		includes(ports: :pictures).where.not(pictures: {imageable: nil})
	}


	# callbacks
	after_save :update_times


	# class methods


	# instance methods
	def all_pictures
		Picture.where(imageable: ports+[self, venue])
	end

	def update_times
		self.update_column(:start_at, self.port_of_calls.first.departs_at)
		self.update_column(:end_at, self.port_of_calls.last.arrives_at)
	end

	def night_length
		(end_at.to_date - start_at.to_date).to_i
	end

	# filters


	# validations

end