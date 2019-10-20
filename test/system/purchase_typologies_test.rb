require "application_system_test_case"

class PurchaseTypologiesTest < ApplicationSystemTestCase
  setup do
    @purchase_typology = purchase_typologies(:one)
  end

  test "visiting the index" do
    visit purchase_typologies_url
    assert_selector "h1", text: "Purchase Typologies"
  end

  test "creating a Purchase typology" do
    visit purchase_typologies_url
    click_on "New Purchase Typology"

    fill_in "Name", with: @purchase_typology.name
    fill_in "Position", with: @purchase_typology.position
    click_on "Create Purchase typology"

    assert_text "Purchase typology was successfully created"
    click_on "Back"
  end

  test "updating a Purchase typology" do
    visit purchase_typologies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @purchase_typology.name
    fill_in "Position", with: @purchase_typology.position
    click_on "Update Purchase typology"

    assert_text "Purchase typology was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase typology" do
    visit purchase_typologies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase typology was successfully destroyed"
  end
end
