json.array!(@ports) do |port|
  json.extract! port, :name, :slug, :location, :content, :latitude, :longitude
  json.url port_url(port, format: :json)
end
