json.array!(@pictures) do |picture|
  json.extract! picture, :id, :title, :caption, :alt, :description, :gh_name, :gh_url, :imageable_id, :imageable_type
  json.url picture_url(picture, format: :json)
end
