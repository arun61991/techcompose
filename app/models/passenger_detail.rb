class PassengerDetail < ApplicationRecord
	belongs_to :booking
	validate do |passenger_detail|
		if passenger_detail.date_of_birth.present? && passenger_detail.date_of_birth > (Date.today - 18.years)
	    	errors.add(:expiration_date, "Aage should be greter then 18 years")
	    end
	end
end
