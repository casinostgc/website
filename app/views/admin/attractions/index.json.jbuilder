json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :name, :content
  json.url attraction_url(attraction, format: :json)
end
