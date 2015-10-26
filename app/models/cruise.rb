class Cruise < ActiveRecord::Base

	# includes and requirements
	include Content
	include Imageable

	# assocations
	belongs_to :venue
	has_many :port_of_calls, dependent: :destroy
	has_many :ports, through: :port_of_calls

	accepts_nested_attributes_for :port_of_calls, reject_if: proc { |attributes| attributes['port_id'].blank? }, allow_destroy: true

	# scopes
	# default_scope { includes(:port_of_calls).where("DATE(start_at) > ?", Date.today ).order(start_at: :asc) }
	default_scope { order(start_at: :asc) }

	scope :future, -> { where("start_at > ?", Time.now) }

	scope :has_image, -> { joins(ports: :pictures).distinct }

	# callbacks
	after_save :update_times


	# class methods
	def pictures
		pics = Picture.where(imageable: self.ports)
		pics = pics.order(reorder_pictures) unless pics.nil?
	end

	# instance methods
	def night_length
		(end_at.to_date - start_at.to_date).to_i
	end

	def date_span
		self.start_at.strftime("%b %d, %Y") + ' - ' + self.end_at.strftime("%b %d, %Y")
	end


	# filters
	def check_ports
		errors[:base] << "At least 2 Port of Calls must be selected." if self.ports.count < 2
	end

	def update_times
		self.update_column(:start_at, self.port_of_calls.first.departs_at)
		self.update_column(:end_at, self.port_of_calls.last.arrives_at)
	end

	def reorder_pictures
		mod_port_ids = self.port_of_calls.drop(1).map{ |p| p.port.pictures.any? ? p.port.pictures.first.id : 0 }
		out = "CASE"
		mod_port_ids.each_with_index do |id, i|
			out << " WHEN id = #{id} THEN #{i}"
		end
		out << " END"
	end

	def icon
		'ship'
	end

	# validations
	# validate :check_ports
	validates :venue_id, presence: true

end
