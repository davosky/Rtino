require "application_system_test_case"

class TransfersTest < ApplicationSystemTestCase
  setup do
    @transfer = transfers(:one)
  end

  test "visiting the index" do
    visit transfers_url
    assert_selector "h1", text: "Transfers"
  end

  test "creating a Transfer" do
    visit transfers_url
    click_on "New Transfer"

    fill_in "Arrival", with: @transfer.arrival
    fill_in "Departure", with: @transfer.departure
    fill_in "Destination", with: @transfer.destination
    fill_in "Destination address", with: @transfer.destination_address
    fill_in "Name", with: @transfer.name
    fill_in "Path lenght", with: @transfer.path_lenght
    fill_in "Start address", with: @transfer.start_address
    fill_in "Start point", with: @transfer.start_point
    fill_in "Transfer date", with: @transfer.transfer_date
    fill_in "Transport", with: @transfer.transport_id
    click_on "Create Transfer"

    assert_text "Transfer was successfully created"
    click_on "Back"
  end

  test "updating a Transfer" do
    visit transfers_url
    click_on "Edit", match: :first

    fill_in "Arrival", with: @transfer.arrival
    fill_in "Departure", with: @transfer.departure
    fill_in "Destination", with: @transfer.destination
    fill_in "Destination address", with: @transfer.destination_address
    fill_in "Name", with: @transfer.name
    fill_in "Path lenght", with: @transfer.path_lenght
    fill_in "Start address", with: @transfer.start_address
    fill_in "Start point", with: @transfer.start_point
    fill_in "Transfer date", with: @transfer.transfer_date
    fill_in "Transport", with: @transfer.transport_id
    click_on "Update Transfer"

    assert_text "Transfer was successfully updated"
    click_on "Back"
  end

  test "destroying a Transfer" do
    visit transfers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transfer was successfully destroyed"
  end
end
