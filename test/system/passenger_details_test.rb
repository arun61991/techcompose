require "application_system_test_case"

class PassengerDetailsTest < ApplicationSystemTestCase
  setup do
    @passenger_detail = passenger_details(:one)
  end

  test "visiting the index" do
    visit passenger_details_url
    assert_selector "h1", text: "Passenger Details"
  end

  test "creating a Passenger detail" do
    visit passenger_details_url
    click_on "New Passenger Detail"

    fill_in "Booking", with: @passenger_detail.booking_id
    fill_in "Date of birth", with: @passenger_detail.date_of_birth
    fill_in "First name", with: @passenger_detail.first_name
    fill_in "Gender", with: @passenger_detail.gender
    fill_in "Last name", with: @passenger_detail.last_name
    click_on "Create Passenger detail"

    assert_text "Passenger detail was successfully created"
    click_on "Back"
  end

  test "updating a Passenger detail" do
    visit passenger_details_url
    click_on "Edit", match: :first

    fill_in "Booking", with: @passenger_detail.booking_id
    fill_in "Date of birth", with: @passenger_detail.date_of_birth
    fill_in "First name", with: @passenger_detail.first_name
    fill_in "Gender", with: @passenger_detail.gender
    fill_in "Last name", with: @passenger_detail.last_name
    click_on "Update Passenger detail"

    assert_text "Passenger detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Passenger detail" do
    visit passenger_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Passenger detail was successfully destroyed"
  end
end
