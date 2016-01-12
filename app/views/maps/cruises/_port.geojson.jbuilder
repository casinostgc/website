json.type "Feature"

json.properties do
	json.name port.name
	json.title port.name
	json.set! 'marker-color', '#E74C3C'
	json.set! 'marker-symbol', 'harbor'
	json.set! 'marker-size', 'medium'
	json.tooltip render('maps/cruises/tooltip.html.erb', port: port)
end

json.geometry do
	json.type "Point"
	json.coordinates [port.longitude,port.latitude]
end
