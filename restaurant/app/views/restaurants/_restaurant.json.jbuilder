json.extract! restaurant, :id, :name, :address, :mobile_no, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
