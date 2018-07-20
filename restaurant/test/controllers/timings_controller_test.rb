require 'test_helper'

class TimingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timing = timings(:one)
  end

  test "should get index" do
    get timings_url
    assert_response :success
  end

  test "should get new" do
    get new_timing_url
    assert_response :success
  end

  test "should create timing" do
    assert_difference('Timing.count') do
      post timings_url, params: { timing: { day: @timing.day, end_time: @timing.end_time, restaurant_id: @timing.restaurant_id, start_time: @timing.start_time } }
    end

    assert_redirected_to timing_url(Timing.last)
  end

  test "should show timing" do
    get timing_url(@timing)
    assert_response :success
  end

  test "should get edit" do
    get edit_timing_url(@timing)
    assert_response :success
  end

  test "should update timing" do
    patch timing_url(@timing), params: { timing: { day: @timing.day, end_time: @timing.end_time, restaurant_id: @timing.restaurant_id, start_time: @timing.start_time } }
    assert_redirected_to timing_url(@timing)
  end

  test "should destroy timing" do
    assert_difference('Timing.count', -1) do
      delete timing_url(@timing)
    end

    assert_redirected_to timings_url
  end
end
