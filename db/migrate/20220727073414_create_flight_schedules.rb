class CreateFlightSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :flight_schedules do |t|
      t.integer :flight_id
      t.integer :departure_airport_id
      t.integer :destination_airport_id
      t.datetime :date
      t.float :price

      t.timestamps
    end
  end
end
