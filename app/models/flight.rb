class Flight < ApplicationRecord
	has_many :flight_schedules, dependent: :destroy
end
