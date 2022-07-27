class AddPnrToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_pnr, :string
  end
end
