require "application_system_test_case"

class TimingsTest < ApplicationSystemTestCase
  setup do
    @timing = timings(:one)
  end

  test "visiting the index" do
    visit timings_url
    assert_selector "h1", text: "Timings"
  end

  test "creating a Timing" do
    visit timings_url
    click_on "New Timing"

    fill_in "Day", with: @timing.day
    fill_in "End Time", with: @timing.end_time
    fill_in "Restaurant", with: @timing.restaurant_id
    fill_in "Start Time", with: @timing.start_time
    click_on "Create Timing"

    assert_text "Timing was successfully created"
    click_on "Back"
  end

  test "updating a Timing" do
    visit timings_url
    click_on "Edit", match: :first

    fill_in "Day", with: @timing.day
    fill_in "End Time", with: @timing.end_time
    fill_in "Restaurant", with: @timing.restaurant_id
    fill_in "Start Time", with: @timing.start_time
    click_on "Update Timing"

    assert_text "Timing was successfully updated"
    click_on "Back"
  end

  test "destroying a Timing" do
    visit timings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timing was successfully destroyed"
  end
end
