module DatetimeFormat
	extend ActiveSupport::Concern

	included do
		attr_accessor :start_string, :end_string
	end

	def convert_str_to_time(time_str)
		DateTime.strptime time_str, '%m/%d/%Y %I:%M %p' unless time_str.nil?
	end

	def convert_time_to_str(time)
		time.strftime('%m/%d/%Y %I:%M %p') unless time.nil?
	end

end