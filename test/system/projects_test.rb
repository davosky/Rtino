require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "End date", with: @project.end_date
    fill_in "Location", with: @project.location_id
    fill_in "Name", with: @project.name
    fill_in "Office", with: @project.office_id
    fill_in "Project description", with: @project.project_description
    fill_in "Project priority", with: @project.project_priority
    fill_in "Project status", with: @project.project_status_id
    fill_in "Project typology", with: @project.project_typology_id
    fill_in "Start date", with: @project.start_date
    fill_in "Structure", with: @project.structure_id
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "End date", with: @project.end_date
    fill_in "Location", with: @project.location_id
    fill_in "Name", with: @project.name
    fill_in "Office", with: @project.office_id
    fill_in "Project description", with: @project.project_description
    fill_in "Project priority", with: @project.project_priority
    fill_in "Project status", with: @project.project_status_id
    fill_in "Project typology", with: @project.project_typology_id
    fill_in "Start date", with: @project.start_date
    fill_in "Structure", with: @project.structure_id
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
