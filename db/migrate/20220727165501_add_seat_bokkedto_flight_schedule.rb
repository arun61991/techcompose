class AddSeatBokkedtoFlightSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :flight_schedules, :seat_booked, :integer, :default => 0
  end
end
