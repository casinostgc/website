json.array!(@events) do |event|
  json.extract! event, :id, :title, :slug, :venue_id, :host, :start_at, :end_at, :type, :content
  json.url event_url(event, format: :json)
end
