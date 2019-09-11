require 'test_helper'

class AssistancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assistance = assistances(:one)
  end

  test "should get index" do
    get assistances_url
    assert_response :success
  end

  test "should get new" do
    get new_assistance_url
    assert_response :success
  end

  test "should create assistance" do
    assert_difference('Assistance.count') do
      post assistances_url, params: { assistance: { category_id: @assistance.category_id, description: @assistance.description, end_time: @assistance.end_time, name: @assistance.name, note: @assistance.note, office_id: @assistance.office_id, report_id: @assistance.report_id, start_time: @assistance.start_time } }
    end

    assert_redirected_to assistance_url(Assistance.last)
  end

  test "should show assistance" do
    get assistance_url(@assistance)
    assert_response :success
  end

  test "should get edit" do
    get edit_assistance_url(@assistance)
    assert_response :success
  end

  test "should update assistance" do
    patch assistance_url(@assistance), params: { assistance: { category_id: @assistance.category_id, description: @assistance.description, end_time: @assistance.end_time, name: @assistance.name, note: @assistance.note, office_id: @assistance.office_id, report_id: @assistance.report_id, start_time: @assistance.start_time } }
    assert_redirected_to assistance_url(@assistance)
  end

  test "should destroy assistance" do
    assert_difference('Assistance.count', -1) do
      delete assistance_url(@assistance)
    end

    assert_redirected_to assistances_url
  end
end
