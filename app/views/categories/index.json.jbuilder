json.array!(@categories) do |category|
  json.extract! category, :id, :name, :slug, :default
  json.url category_url(category, format: :json)
end
