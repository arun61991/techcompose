class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :code
      t.integer :no_of_seat

      t.timestamps
    end
  end
end
