class Cruise < Event

	# includes and requirements

	# assocations
	has_many :port_of_calls, foreign_key: 'event_id', dependent: :destroy
	has_many :ports, through: :port_of_calls

	accepts_nested_attributes_for :port_of_calls, reject_if: proc { |attributes| attributes['port_id'].blank? }, allow_destroy: true

	# scopes
	default_scope { includes(:port_of_calls).where("DATE(start_at) > ?", Date.today ).order(start_at: :asc) }

	scope :has_image, -> { joins(ports: :pictures).distinct }

	# callbacks
	after_save :update_times


	# class methods
	def pictures
		Picture.where(imageable: self.ports).reorder(reorder_pictures)
	end

	# instance methods
	def update_times
		puts "updating cruise times"
		self.update_column(:start_at, self.port_of_calls.first.departs_at)
		self.update_column(:end_at, self.port_of_calls.last.arrives_at)
	end

	def night_length
		(end_at.to_date - start_at.to_date).to_i
	end

	# filters
	def check_ports
		puts 'checking port count'
		errors[:base] << "At least 2 Port of Calls must be selected." if self.port_of_calls.count < 2
	end

	def reorder_pictures
		mod_port_ids = self.port_of_calls.drop(1).map{ |p| p.port.pictures.first.id }
		out = "CASE"
		mod_port_ids.each_with_index do |id, i|
			out << " WHEN id = '#{id}' THEN #{i}"
		end
		out << " END"
	end

	# validations
	validate :check_ports

end