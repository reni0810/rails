require "application_system_test_case"

class UnavailabitiesTest < ApplicationSystemTestCase
  setup do
    @unavailabity = unavailabities(:one)
  end

  test "visiting the index" do
    visit unavailabities_url
    assert_selector "h1", text: "Unavailabities"
  end

  test "creating a Unavailabity" do
    visit unavailabities_url
    click_on "New Unavailabity"

    fill_in "Date", with: @unavailabity.date
    fill_in "End Time", with: @unavailabity.end_time
    fill_in "Full Day", with: @unavailabity.full_day
    fill_in "Restaurant", with: @unavailabity.restaurant_id
    fill_in "Start Time", with: @unavailabity.start_time
    click_on "Create Unavailabity"

    assert_text "Unavailabity was successfully created"
    click_on "Back"
  end

  test "updating a Unavailabity" do
    visit unavailabities_url
    click_on "Edit", match: :first

    fill_in "Date", with: @unavailabity.date
    fill_in "End Time", with: @unavailabity.end_time
    fill_in "Full Day", with: @unavailabity.full_day
    fill_in "Restaurant", with: @unavailabity.restaurant_id
    fill_in "Start Time", with: @unavailabity.start_time
    click_on "Update Unavailabity"

    assert_text "Unavailabity was successfully updated"
    click_on "Back"
  end

  test "destroying a Unavailabity" do
    visit unavailabities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unavailabity was successfully destroyed"
  end
end
