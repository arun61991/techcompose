require 'test_helper'

class FlightSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flight_schedule = flight_schedules(:one)
  end

  test "should get index" do
    get flight_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_flight_schedule_url
    assert_response :success
  end

  test "should create flight_schedule" do
    assert_difference('FlightSchedule.count') do
      post flight_schedules_url, params: { flight_schedule: { date: @flight_schedule.date, departure_airport_id: @flight_schedule.departure_airport_id, destination_airport_id: @flight_schedule.destination_airport_id, flight_id: @flight_schedule.flight_id, price: @flight_schedule.price } }
    end

    assert_redirected_to flight_schedule_url(FlightSchedule.last)
  end

  test "should show flight_schedule" do
    get flight_schedule_url(@flight_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_flight_schedule_url(@flight_schedule)
    assert_response :success
  end

  test "should update flight_schedule" do
    patch flight_schedule_url(@flight_schedule), params: { flight_schedule: { date: @flight_schedule.date, departure_airport_id: @flight_schedule.departure_airport_id, destination_airport_id: @flight_schedule.destination_airport_id, flight_id: @flight_schedule.flight_id, price: @flight_schedule.price } }
    assert_redirected_to flight_schedule_url(@flight_schedule)
  end

  test "should destroy flight_schedule" do
    assert_difference('FlightSchedule.count', -1) do
      delete flight_schedule_url(@flight_schedule)
    end

    assert_redirected_to flight_schedules_url
  end
end
