json.array!(@images) do |image|
  json.extract! image, :id, :title, :picture, :user_id, :category_id
  json.url image_url(image, format: :json)
end
