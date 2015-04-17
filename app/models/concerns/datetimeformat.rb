module Datetimeformat
	extend ActiveSupport::Concern

	def date_time_picker_format(date)
		begin
			parsed = DateTime.strptime(date,'%m/%d/%Y %I:%M %p')
			super parsed
		rescue
			date         
		end
	end

	# def start_at=(date)
	# 	date_time_picker_format(date)
	# end

	# def end_at=(date)
	# 	date_time_picker_format(date)
	# end

	def date_span
		self.start_at.strftime("%b %d, %Y") + ' - ' + self.end_at.strftime("%b %d, %Y")
	end

end