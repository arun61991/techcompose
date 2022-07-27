require "application_system_test_case"

class FlightSchedulesTest < ApplicationSystemTestCase
  setup do
    @flight_schedule = flight_schedules(:one)
  end

  test "visiting the index" do
    visit flight_schedules_url
    assert_selector "h1", text: "Flight Schedules"
  end

  test "creating a Flight schedule" do
    visit flight_schedules_url
    click_on "New Flight Schedule"

    fill_in "Date", with: @flight_schedule.date
    fill_in "Departure airport", with: @flight_schedule.departure_airport_id
    fill_in "Destination airport", with: @flight_schedule.destination_airport_id
    fill_in "Flight", with: @flight_schedule.flight_id
    fill_in "Price", with: @flight_schedule.price
    click_on "Create Flight schedule"

    assert_text "Flight schedule was successfully created"
    click_on "Back"
  end

  test "updating a Flight schedule" do
    visit flight_schedules_url
    click_on "Edit", match: :first

    fill_in "Date", with: @flight_schedule.date
    fill_in "Departure airport", with: @flight_schedule.departure_airport_id
    fill_in "Destination airport", with: @flight_schedule.destination_airport_id
    fill_in "Flight", with: @flight_schedule.flight_id
    fill_in "Price", with: @flight_schedule.price
    click_on "Update Flight schedule"

    assert_text "Flight schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Flight schedule" do
    visit flight_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flight schedule was successfully destroyed"
  end
end
