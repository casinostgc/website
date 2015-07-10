json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :slug, :address, :latitude, :longitude, :type, :content
  json.url venue_url(venue, format: :json)
end
