json.array!(@pictures) do |picture|
  json.extract! picture, :id, :title, :caption, :alt, :description, :image_url, :imageable_id, :imageable_type
  json.url picture_url(picture, format: :json)
end
