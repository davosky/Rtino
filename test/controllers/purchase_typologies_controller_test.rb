require 'test_helper'

class PurchaseTypologiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_typology = purchase_typologies(:one)
  end

  test "should get index" do
    get purchase_typologies_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_typology_url
    assert_response :success
  end

  test "should create purchase_typology" do
    assert_difference('PurchaseTypology.count') do
      post purchase_typologies_url, params: { purchase_typology: { name: @purchase_typology.name, position: @purchase_typology.position } }
    end

    assert_redirected_to purchase_typology_url(PurchaseTypology.last)
  end

  test "should show purchase_typology" do
    get purchase_typology_url(@purchase_typology)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_typology_url(@purchase_typology)
    assert_response :success
  end

  test "should update purchase_typology" do
    patch purchase_typology_url(@purchase_typology), params: { purchase_typology: { name: @purchase_typology.name, position: @purchase_typology.position } }
    assert_redirected_to purchase_typology_url(@purchase_typology)
  end

  test "should destroy purchase_typology" do
    assert_difference('PurchaseTypology.count', -1) do
      delete purchase_typology_url(@purchase_typology)
    end

    assert_redirected_to purchase_typologies_url
  end
end
