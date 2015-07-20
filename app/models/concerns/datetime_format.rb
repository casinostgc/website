module DatetimeFormat
	extend ActiveSupport::Concern


	included do
		
	end

	def convert_start_time
		# dt = 
	end

	def convert_str_to_time(time_str)
		DateTime.strptime time_str, '%m/%d/%Y %I:%M %p' unless time_str.nil?
	end

	def convert_time_to_str(time)
		time.strftime('%m/%d/%Y %I:%M %p') unless time.nil?
	end

	# def date_time_picker_format(date)
	# 	begin
	# 		parsed = DateTime.strptime(date,'%m/%d/%Y %I:%M %p')
	# 		super parsed
	# 	rescue
	# 		date
	# 	end
	# end

	# def start_at=(date)
	# 	date_time_picker_format(date)
	# end

	# def end_at=(date)
	# 	date_time_picker_format(date)
	# end

	# def date_span
	# 	self.start_at.strftime("%b %d, %Y") + ' - ' + self.end_at.strftime("%b %d, %Y")
	# end

end