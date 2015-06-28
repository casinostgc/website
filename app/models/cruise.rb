class Cruise < ActiveRecord::Base

	include Content
	include Datetimeformat
	# include NestedPictures

	after_save :update_times

	# default_scope { order(start_at: :asc) }
	default_scope { where("DATE(start_at) > ?", DateTime.now).order(start_at: :asc) }

	belongs_to :venue

	has_many :port_of_calls
	has_many :ports, through: :port_of_calls
	accepts_nested_attributes_for :port_of_calls, reject_if: proc { |attributes| attributes['port_id'].blank? }, allow_destroy: true

	validates :venue_id, presence: true

	def update_times
		self.update_column(:start_at, self.port_of_calls.first.departs_at)
		self.update_column(:end_at, self.port_of_calls.last.arrives_at)
	end

	def night_length
		(end_at.to_date - start_at.to_date).to_i
	end

end
