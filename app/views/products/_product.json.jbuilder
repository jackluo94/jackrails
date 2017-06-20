json.extract! product, :id, :name, :description, :qty_on_hand, :price, :cost, :shipping_weight, :thumbnail, :full_size, :created_at, :updated_at
json.url product_url(product, format: :json)
