require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase = purchases(:one)
  end

  test "should get index" do
    get purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_url
    assert_response :success
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post purchases_url, params: { purchase: { amount: @purchase.amount, category_id: @purchase.category_id, delivery_date: @purchase.delivery_date, description: @purchase.description, installation_date: @purchase.installation_date, location_id: @purchase.location_id, name: @purchase.name, purchase_approval_date: @purchase.purchase_approval_date, purchase_approval_person: @purchase.purchase_approval_person, purchase_date: @purchase.purchase_date, purchase_typology_id: @purchase.purchase_typology_id, request_date: @purchase.request_date, request_person: @purchase.request_person, structure_id: @purchase.structure_id, vendor_id: @purchase.vendor_id } }
    end

    assert_redirected_to purchase_url(Purchase.last)
  end

  test "should show purchase" do
    get purchase_url(@purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_url(@purchase)
    assert_response :success
  end

  test "should update purchase" do
    patch purchase_url(@purchase), params: { purchase: { amount: @purchase.amount, category_id: @purchase.category_id, delivery_date: @purchase.delivery_date, description: @purchase.description, installation_date: @purchase.installation_date, location_id: @purchase.location_id, name: @purchase.name, purchase_approval_date: @purchase.purchase_approval_date, purchase_approval_person: @purchase.purchase_approval_person, purchase_date: @purchase.purchase_date, purchase_typology_id: @purchase.purchase_typology_id, request_date: @purchase.request_date, request_person: @purchase.request_person, structure_id: @purchase.structure_id, vendor_id: @purchase.vendor_id } }
    assert_redirected_to purchase_url(@purchase)
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete purchase_url(@purchase)
    end

    assert_redirected_to purchases_url
  end
end
