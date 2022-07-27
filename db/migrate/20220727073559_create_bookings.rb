class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :flight_schedule_id
      t.string :status

      t.timestamps
    end
  end
end
