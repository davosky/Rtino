require "application_system_test_case"

class ProjectTypologiesTest < ApplicationSystemTestCase
  setup do
    @project_typology = project_typologies(:one)
  end

  test "visiting the index" do
    visit project_typologies_url
    assert_selector "h1", text: "Project Typologies"
  end

  test "creating a Project typology" do
    visit project_typologies_url
    click_on "New Project Typology"

    fill_in "Name", with: @project_typology.name
    fill_in "Position", with: @project_typology.position
    click_on "Create Project typology"

    assert_text "Project typology was successfully created"
    click_on "Back"
  end

  test "updating a Project typology" do
    visit project_typologies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @project_typology.name
    fill_in "Position", with: @project_typology.position
    click_on "Update Project typology"

    assert_text "Project typology was successfully updated"
    click_on "Back"
  end

  test "destroying a Project typology" do
    visit project_typologies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project typology was successfully destroyed"
  end
end
