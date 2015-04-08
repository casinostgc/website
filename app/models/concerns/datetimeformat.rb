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

end