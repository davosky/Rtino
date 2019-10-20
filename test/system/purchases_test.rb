require "application_system_test_case"

class PurchasesTest < ApplicationSystemTestCase
  setup do
    @purchase = purchases(:one)
  end

  test "visiting the index" do
    visit purchases_url
    assert_selector "h1", text: "Purchases"
  end

  test "creating a Purchase" do
    visit purchases_url
    click_on "New Purchase"

    fill_in "Amount", with: @purchase.amount
    fill_in "Category", with: @purchase.category_id
    fill_in "Delivery date", with: @purchase.delivery_date
    fill_in "Description", with: @purchase.description
    fill_in "Installation date", with: @purchase.installation_date
    fill_in "Location", with: @purchase.location_id
    fill_in "Name", with: @purchase.name
    fill_in "Purchase approval date", with: @purchase.purchase_approval_date
    fill_in "Purchase approval person", with: @purchase.purchase_approval_person
    fill_in "Purchase date", with: @purchase.purchase_date
    fill_in "Purchase typology", with: @purchase.purchase_typology_id
    fill_in "Request date", with: @purchase.request_date
    fill_in "Request person", with: @purchase.request_person
    fill_in "Structure", with: @purchase.structure_id
    fill_in "Vendor", with: @purchase.vendor_id
    click_on "Create Purchase"

    assert_text "Purchase was successfully created"
    click_on "Back"
  end

  test "updating a Purchase" do
    visit purchases_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @purchase.amount
    fill_in "Category", with: @purchase.category_id
    fill_in "Delivery date", with: @purchase.delivery_date
    fill_in "Description", with: @purchase.description
    fill_in "Installation date", with: @purchase.installation_date
    fill_in "Location", with: @purchase.location_id
    fill_in "Name", with: @purchase.name
    fill_in "Purchase approval date", with: @purchase.purchase_approval_date
    fill_in "Purchase approval person", with: @purchase.purchase_approval_person
    fill_in "Purchase date", with: @purchase.purchase_date
    fill_in "Purchase typology", with: @purchase.purchase_typology_id
    fill_in "Request date", with: @purchase.request_date
    fill_in "Request person", with: @purchase.request_person
    fill_in "Structure", with: @purchase.structure_id
    fill_in "Vendor", with: @purchase.vendor_id
    click_on "Update Purchase"

    assert_text "Purchase was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase" do
    visit purchases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase was successfully destroyed"
  end
end
