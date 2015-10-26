json.array!(@cruises) do |cruise|
  json.extract! cruise, :id, :title, :slug, :venue_id, :start_at, :end_at, :content
  json.url cruise_url(cruise, format: :json)
end
