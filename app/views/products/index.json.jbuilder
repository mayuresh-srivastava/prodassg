json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :description, :color, :quantity, :image, :weight
  json.url product_url(product, format: :json)
end
