json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :slug, :address, :latitude, :longitude, :cruise_line, :content
  json.url venue_url(venue, format: :json)
end
