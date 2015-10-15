json.array!(@adds) do |add|
  json.extract! add, :id, :title, :body, :active
  json.url add_url(add, format: :json)
end
