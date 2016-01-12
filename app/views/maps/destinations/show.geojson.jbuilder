json.type "FeatureCollection"

json.crs do
	json.type "name"
	json.properties do
		json.name "urn:ogc:def:crs:OGC:1.3:CRS84"
	end
end

json.features @destination.casinos do |casino|
	json.partial! 'maps/casinos/casino', casino: casino
end
