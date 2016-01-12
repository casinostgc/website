json.type "FeatureCollection"

json.crs do
	json.type "name"
	json.properties do
		json.name "urn:ogc:def:crs:OGC:1.3:CRS84"
	end
end

json.features @cruise_list.ports do |port|
	json.partial! 'maps/cruise_lists/port', port: port
end
