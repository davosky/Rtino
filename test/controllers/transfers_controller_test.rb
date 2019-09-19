require 'test_helper'

class TransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transfer = transfers(:one)
  end

  test "should get index" do
    get transfers_url
    assert_response :success
  end

  test "should get new" do
    get new_transfer_url
    assert_response :success
  end

  test "should create transfer" do
    assert_difference('Transfer.count') do
      post transfers_url, params: { transfer: { arrival: @transfer.arrival, departure: @transfer.departure, destination: @transfer.destination, destination_address: @transfer.destination_address, name: @transfer.name, path_lenght: @transfer.path_lenght, start_address: @transfer.start_address, start_point: @transfer.start_point, transfer_date: @transfer.transfer_date, transport_id: @transfer.transport_id } }
    end

    assert_redirected_to transfer_url(Transfer.last)
  end

  test "should show transfer" do
    get transfer_url(@transfer)
    assert_response :success
  end

  test "should get edit" do
    get edit_transfer_url(@transfer)
    assert_response :success
  end

  test "should update transfer" do
    patch transfer_url(@transfer), params: { transfer: { arrival: @transfer.arrival, departure: @transfer.departure, destination: @transfer.destination, destination_address: @transfer.destination_address, name: @transfer.name, path_lenght: @transfer.path_lenght, start_address: @transfer.start_address, start_point: @transfer.start_point, transfer_date: @transfer.transfer_date, transport_id: @transfer.transport_id } }
    assert_redirected_to transfer_url(@transfer)
  end

  test "should destroy transfer" do
    assert_difference('Transfer.count', -1) do
      delete transfer_url(@transfer)
    end

    assert_redirected_to transfers_url
  end
end
