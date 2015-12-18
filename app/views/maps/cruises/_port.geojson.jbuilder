json.type "Feature"

json.properties do
	json.name port.name
	json.title port.name
	json.set! 'marker-color', '#f00'
	json.set! 'marker-symbol', 'harbor'
	json.set! 'marker-size', 'medium'
end

json.geometry do
	json.type "Point"
	json.coordinates [port.longitude,port.latitude]
end
