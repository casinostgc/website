json.array!(@ports) do |port|
  json.extract! port, :id, :name, :slug, :content, :location, :latitude, :longitude
  json.url port_url(port, format: :json)
end
