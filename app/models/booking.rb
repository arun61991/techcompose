class Booking < ApplicationRecord
	before_create :get_pnr
	after_create :get_seat_booked
	belongs_to :flight_schedule
	has_many :passenger_details, dependent: :destroy
	accepts_nested_attributes_for :passenger_details

	validate do |booking|
		if self.status != "cancled"
			total_seat = booking.flight_schedule.flight.no_of_seat
			number_of_passenger = booking.passenger_details.length
			available_seat = total_seat - booking.flight_schedule.seat_booked
			if available_seat < number_of_passenger 
				errors.add(:expiration_date, "#{number_of_passenger} Seat Not available please select another flight")
			end
		end
	end

	scope :confirmed?, -> { where('status = ?', "confirmed") }

	def get_seat_booked
		self.flight_schedule.update(seat_booked: get_total_confirmed_set)
    end

	def get_pnr
		self.booking_pnr = get_uniq_8_digit_code
    end

    def get_total_confirmed_set
    	self.flight_schedule.seat_booked + self.passenger_details.length
    end

    def get_uniq_8_digit_code
    	SecureRandom.urlsafe_base64(8)
    end
end
