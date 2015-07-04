json.array!(@casinos) do |casino|
  json.extract! casino, :id, :name, :slug, :address, :latitude, :longitude, :content
  json.url casino_url(casino, format: :json)
end
