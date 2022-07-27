json.extract! booking, :id, :flight_schedule_id, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
