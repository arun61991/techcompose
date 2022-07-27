# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
airports = {:AMD => "Ahmedabad",
            :NDH => "New Delhi",
            :KOL => "Kolkata",
            :CHN => "Chenai",
            :BAN => "Bengluru",
            :JPR => "Jaipur",
            :JOH => "Jodhpur"
}

airports.each do |k, v|
  Airport.create(code: k, city: v)
end

all_airports = Airport.all


index = airports.length - 1

flights = {
	:A2BH09 => "Indigo",
	:A2BH10 => "Indigo",
	:A2BH11 => "Indigo",
	:A2BH12 => "Indigo",
	:A3BH09 => "AirIndia",
	:A3BH10 => "AirIndia",
	:A3BH11 => "AirIndia"
}

flights.each do |k, v|
  Flight.create(code: k, name: v, no_of_seat: rand(6..10))
end

all_flights = Flight.all


flight_index = all_flights.length - 1

1000.times do
  departure_airport = all_airports[rand(0..index)].id
  destination_airport = all_airports[rand(1..index)].id
  FlightSchedule.create(date: rand(4.days).seconds.from_now,
                departure_airport_id: departure_airport,
                destination_airport_id: destination_airport,
                flight_id: all_flights[rand(0..flight_index)].id,
                price: rand(200..1000)) if departure_airport != destination_airport
end
