json.array!(@animal_images) do |animal_image|
  json.extract! animal_image, :id, :animal_id, :images
  json.url animal_image_url(animal_image, format: :json)
end
