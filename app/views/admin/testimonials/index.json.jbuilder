json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :name, :subject, :content
  json.url testimonial_url(testimonial, format: :json)
end
