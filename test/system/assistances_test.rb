require "application_system_test_case"

class AssistancesTest < ApplicationSystemTestCase
  setup do
    @assistance = assistances(:one)
  end

  test "visiting the index" do
    visit assistances_url
    assert_selector "h1", text: "Assistances"
  end

  test "creating a Assistance" do
    visit assistances_url
    click_on "New Assistance"

    fill_in "Category", with: @assistance.category_id
    fill_in "Description", with: @assistance.description
    fill_in "End time", with: @assistance.end_time
    fill_in "Name", with: @assistance.name
    fill_in "Note", with: @assistance.note
    fill_in "Office", with: @assistance.office_id
    fill_in "Report", with: @assistance.report_id
    fill_in "Start time", with: @assistance.start_time
    click_on "Create Assistance"

    assert_text "Assistance was successfully created"
    click_on "Back"
  end

  test "updating a Assistance" do
    visit assistances_url
    click_on "Edit", match: :first

    fill_in "Category", with: @assistance.category_id
    fill_in "Description", with: @assistance.description
    fill_in "End time", with: @assistance.end_time
    fill_in "Name", with: @assistance.name
    fill_in "Note", with: @assistance.note
    fill_in "Office", with: @assistance.office_id
    fill_in "Report", with: @assistance.report_id
    fill_in "Start time", with: @assistance.start_time
    click_on "Update Assistance"

    assert_text "Assistance was successfully updated"
    click_on "Back"
  end

  test "destroying a Assistance" do
    visit assistances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assistance was successfully destroyed"
  end
end
