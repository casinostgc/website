json.array!(@events) do |event|
  json.extract! event, :id, :title, :slug, :content, :start_at, :end_at, :venue_id, :image_id
  json.url event_url(event, format: :json)
end
