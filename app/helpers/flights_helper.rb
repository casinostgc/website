module FlightsHelper

	def airport_popover(location)
		content_tag :abbr, location.iata, title: location.name, data: {toggle: :popover, placement: :top, content: location.location}
	end

end
