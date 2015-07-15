json.array!(@casinos) do |casino|
  json.extract! casino, :id, :name, :slug, :address, :latitude, :longitude, :content, :destination_id
  json.url casino_url(casino, format: :json)
end
