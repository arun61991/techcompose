class Airport < ApplicationRecord
	has_many :departure_airports, :class_name => "FlightSchedule", :foreign_key => "departure_airport_id"
	has_many :destination_airports, :class_name => "FlightSchedule", :foreign_key => "destination_airport_id"
end
