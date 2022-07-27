class FlightSchedule < ApplicationRecord
	belongs_to :flight
	has_many :bookings, dependent: :destroy
	belongs_to :departure_airport, :class_name => "Airport"
	belongs_to :destination_airport, :class_name => "Airport"
	scope :search_by_params, -> (params) { where('departure_airport_id = ? and destination_airport_id = ? and date > ? and date < ?', params[:departure_airport_id], params[:destination_airport_id], params[:departure_date].to_date || Date.today, (params[:departure_date].to_date || Date.today) + 1.day) }

end
