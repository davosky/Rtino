require 'test_helper'

class ProjectStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_status = project_statuses(:one)
  end

  test "should get index" do
    get project_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_project_status_url
    assert_response :success
  end

  test "should create project_status" do
    assert_difference('ProjectStatus.count') do
      post project_statuses_url, params: { project_status: { name: @project_status.name, position: @project_status.position } }
    end

    assert_redirected_to project_status_url(ProjectStatus.last)
  end

  test "should show project_status" do
    get project_status_url(@project_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_status_url(@project_status)
    assert_response :success
  end

  test "should update project_status" do
    patch project_status_url(@project_status), params: { project_status: { name: @project_status.name, position: @project_status.position } }
    assert_redirected_to project_status_url(@project_status)
  end

  test "should destroy project_status" do
    assert_difference('ProjectStatus.count', -1) do
      delete project_status_url(@project_status)
    end

    assert_redirected_to project_statuses_url
  end
end
