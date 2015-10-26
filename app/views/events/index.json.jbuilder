json.array!(@events) do |event|
  json.extract! event, :id, :title, :slug, :venue_id_id, :start_at, :end_at, :content
  json.url event_url(event, format: :json)
end
