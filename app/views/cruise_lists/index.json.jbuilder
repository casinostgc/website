json.array!(@cruise_lists) do |cruise_list|
  json.extract! cruise_list, :id, :title, :slug, :venue_id, :content
  json.url cruise_list_url(cruise_list, format: :json)
end
