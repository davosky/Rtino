require "application_system_test_case"

class ProjectStatusesTest < ApplicationSystemTestCase
  setup do
    @project_status = project_statuses(:one)
  end

  test "visiting the index" do
    visit project_statuses_url
    assert_selector "h1", text: "Project Statuses"
  end

  test "creating a Project status" do
    visit project_statuses_url
    click_on "New Project Status"

    fill_in "Name", with: @project_status.name
    fill_in "Position", with: @project_status.position
    click_on "Create Project status"

    assert_text "Project status was successfully created"
    click_on "Back"
  end

  test "updating a Project status" do
    visit project_statuses_url
    click_on "Edit", match: :first

    fill_in "Name", with: @project_status.name
    fill_in "Position", with: @project_status.position
    click_on "Update Project status"

    assert_text "Project status was successfully updated"
    click_on "Back"
  end

  test "destroying a Project status" do
    visit project_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project status was successfully destroyed"
  end
end
