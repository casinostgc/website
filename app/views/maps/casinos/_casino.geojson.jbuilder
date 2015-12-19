if casino.latitude && casino.longitude

	json.type "Feature"

	json.properties do
		json.title casino.name
		json.name casino.name
		json.image_url (casino.pictures.any? ? casino.pictures.first.image_url : nil)
		json.set! 'marker-color', '#E74C3C'
		json.set! 'marker-symbol', 'commercial'
		json.set! 'marker-size', 'medium'
		json.destination casino.destination.try(:name)
		json.path casino_path(casino)
		json.tooltip render('tooltip.html.erb', casino: casino)
	end

	json.geometry do
		json.type "Point"
		json.coordinates [casino.longitude,casino.latitude]
	end

end
