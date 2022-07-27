json.extract! flight_schedule, :id, :flight_id, :departure_airport_id, :destination_airport_id, :date, :price, :created_at, :updated_at
json.url flight_schedule_url(flight_schedule, format: :json)
