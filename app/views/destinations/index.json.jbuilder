json.array!(@destinations) do |destination|
  json.extract! destination, :id, :name, :slug, :content, :location, :latitude, :longitude, :international
  json.url destination_url(destination, format: :json)
end
