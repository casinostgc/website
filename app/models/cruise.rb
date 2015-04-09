class Cruise < ActiveRecord::Base

	include Content
	include Datetimeformat

	default_scope { order(start_at: :asc) }
	# default_scope { where("DATE(start_at) > ?", DateTime.now).order(start_at: :asc) }

	# belongs_to :venue

	has_many :port_of_calls
	has_many :ports, through: :port_of_calls
	has_many :pictures, as: :imageable

	accepts_nested_attributes_for :port_of_calls, reject_if: proc { |attributes| attributes['port_id'].blank? }, allow_destroy: true


	def start_at=(date)
		date_time_picker_format(date)
	end

	def end_at=(date)
		date_time_picker_format(date)
	end

end
