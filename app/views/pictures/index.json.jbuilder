json.array!(@pictures) do |picture|
  json.extract! picture, :id, :name, :description, :taken_on
  json.url picture_url(picture, format: :json)
end
