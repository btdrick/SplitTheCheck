json.extract! restaurant, :id, :name, :location, :will_split, :wont_split, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
