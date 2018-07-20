require 'test_helper'

class UnavailabitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unavailabity = unavailabities(:one)
  end

  test "should get index" do
    get unavailabities_url
    assert_response :success
  end

  test "should get new" do
    get new_unavailabity_url
    assert_response :success
  end

  test "should create unavailabity" do
    assert_difference('Unavailabity.count') do
      post unavailabities_url, params: { unavailabity: { date: @unavailabity.date, end_time: @unavailabity.end_time, full_day: @unavailabity.full_day, restaurant_id: @unavailabity.restaurant_id, start_time: @unavailabity.start_time } }
    end

    assert_redirected_to unavailabity_url(Unavailabity.last)
  end

  test "should show unavailabity" do
    get unavailabity_url(@unavailabity)
    assert_response :success
  end

  test "should get edit" do
    get edit_unavailabity_url(@unavailabity)
    assert_response :success
  end

  test "should update unavailabity" do
    patch unavailabity_url(@unavailabity), params: { unavailabity: { date: @unavailabity.date, end_time: @unavailabity.end_time, full_day: @unavailabity.full_day, restaurant_id: @unavailabity.restaurant_id, start_time: @unavailabity.start_time } }
    assert_redirected_to unavailabity_url(@unavailabity)
  end

  test "should destroy unavailabity" do
    assert_difference('Unavailabity.count', -1) do
      delete unavailabity_url(@unavailabity)
    end

    assert_redirected_to unavailabities_url
  end
end
