json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :birth_date, :photo, :height, :weight, :description, :entry_date, :status, :medical_conditions, :animal_type
  json.url animal_url(animal, format: :json)
end
