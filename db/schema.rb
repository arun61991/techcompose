# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_27_165501) do

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "flight_schedule_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "booking_pnr"
  end

  create_table "flight_schedules", force: :cascade do |t|
    t.integer "flight_id"
    t.integer "departure_airport_id"
    t.integer "destination_airport_id"
    t.datetime "date"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "seat_booked", default: 0
  end

  create_table "flights", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "no_of_seat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "passenger_details", force: :cascade do |t|
    t.integer "booking_id"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
