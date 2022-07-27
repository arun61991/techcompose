require 'test_helper'

class PassengerDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passenger_detail = passenger_details(:one)
  end

  test "should get index" do
    get passenger_details_url
    assert_response :success
  end

  test "should get new" do
    get new_passenger_detail_url
    assert_response :success
  end

  test "should create passenger_detail" do
    assert_difference('PassengerDetail.count') do
      post passenger_details_url, params: { passenger_detail: { booking_id: @passenger_detail.booking_id, date_of_birth: @passenger_detail.date_of_birth, first_name: @passenger_detail.first_name, gender: @passenger_detail.gender, last_name: @passenger_detail.last_name } }
    end

    assert_redirected_to passenger_detail_url(PassengerDetail.last)
  end

  test "should show passenger_detail" do
    get passenger_detail_url(@passenger_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_passenger_detail_url(@passenger_detail)
    assert_response :success
  end

  test "should update passenger_detail" do
    patch passenger_detail_url(@passenger_detail), params: { passenger_detail: { booking_id: @passenger_detail.booking_id, date_of_birth: @passenger_detail.date_of_birth, first_name: @passenger_detail.first_name, gender: @passenger_detail.gender, last_name: @passenger_detail.last_name } }
    assert_redirected_to passenger_detail_url(@passenger_detail)
  end

  test "should destroy passenger_detail" do
    assert_difference('PassengerDetail.count', -1) do
      delete passenger_detail_url(@passenger_detail)
    end

    assert_redirected_to passenger_details_url
  end
end
