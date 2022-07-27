json.extract! passenger_detail, :id, :booking_id, :first_name, :last_name, :gender, :date_of_birth, :created_at, :updated_at
json.url passenger_detail_url(passenger_detail, format: :json)
