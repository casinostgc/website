module FlightsHelper

	def airport_popover(location)
		content_tag :abbr, location.iata, title: location.name, data: {toggle: :popover, placement: :top, content: location.location}
	end

	def flight_info(flight)
		raw "From #{airport_popover(flight.departing_location)} - " + flight.departing_at.strftime("%B %d, %Y")
	end

	def flight_title(flight)
		out = "From #{flight.departing_location.iata} to #{flight.casino.name}"
		out += "<br><small>#{flight.departing_at.to_formatted_s(:long_ordinal)}</small>"
		raw out
	end

end
