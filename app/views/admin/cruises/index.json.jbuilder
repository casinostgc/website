json.array!(@cruises) do |cruise|
  json.extract! cruise, :id, :title, :slug, :content, :start_at, :end_at, :venue_id
  json.url cruise_url(cruise, format: :json)
end
