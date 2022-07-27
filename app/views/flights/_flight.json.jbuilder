json.extract! flight, :id, :name, :code, :no_of_seat, :created_at, :updated_at
json.url flight_url(flight, format: :json)
