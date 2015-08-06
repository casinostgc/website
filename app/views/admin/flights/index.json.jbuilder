json.array!(@flights) do |flight|
  json.extract! flight, :id, :destination_id, :departing_location, :departing_at, :arriving_location, :arriving_at
  json.url flight_url(flight, format: :json)
end
