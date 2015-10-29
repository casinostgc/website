module DatetimeFormat
	extend ActiveSupport::Concern

	included do
	end

	module ClassMethods
		attr_reader :spec_datetime_vars

		def datetime_vars(variables={})
			@spec_datetime_vars = variables
		end

	end

	# instance classes
	def convert_str_to_time(time_str)
		DateTime.strptime time_str, '%m/%d/%Y %I:%M %p' unless time_str.blank?
	end

	def convert_time_to_str(time)
		time.strftime('%m/%d/%Y %I:%M %p') unless time.blank?
	end

	# 
	def start_string
		convert_time_to_str self.send( self.class.spec_datetime_vars[:start_var].to_s )
	end

	def start_string=(time_str)
		self.send "#{self.class.spec_datetime_vars[:start_var]}=", convert_str_to_time(time_str)
	end

	def end_string
		convert_time_to_str self.send( self.class.spec_datetime_vars[:end_var].to_s )
	end

	def end_string=(time_str)
		self.send "#{self.class.spec_datetime_vars[:end_var]}=", convert_str_to_time(time_str)
	end

end