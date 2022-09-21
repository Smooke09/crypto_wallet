json.extract! coin, :id, :description, :acronym, :img_url, :created_at, :updated_at
json.url coin_url(coin, format: :json)
