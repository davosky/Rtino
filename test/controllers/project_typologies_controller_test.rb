require 'test_helper'

class ProjectTypologiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_typology = project_typologies(:one)
  end

  test "should get index" do
    get project_typologies_url
    assert_response :success
  end

  test "should get new" do
    get new_project_typology_url
    assert_response :success
  end

  test "should create project_typology" do
    assert_difference('ProjectTypology.count') do
      post project_typologies_url, params: { project_typology: { name: @project_typology.name, position: @project_typology.position } }
    end

    assert_redirected_to project_typology_url(ProjectTypology.last)
  end

  test "should show project_typology" do
    get project_typology_url(@project_typology)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_typology_url(@project_typology)
    assert_response :success
  end

  test "should update project_typology" do
    patch project_typology_url(@project_typology), params: { project_typology: { name: @project_typology.name, position: @project_typology.position } }
    assert_redirected_to project_typology_url(@project_typology)
  end

  test "should destroy project_typology" do
    assert_difference('ProjectTypology.count', -1) do
      delete project_typology_url(@project_typology)
    end

    assert_redirected_to project_typologies_url
  end
end
