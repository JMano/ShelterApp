json.array!(@adoptions) do |adoption|
  json.extract! adoption, :id, :date, :photo, :description, :type, :end_date
  json.url adoption_url(adoption, format: :json)
end
