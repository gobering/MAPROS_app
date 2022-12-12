require "application_system_test_case"

class DangerousSpotsTest < ApplicationSystemTestCase
  setup do
    @dangerous_spot = dangerous_spots(:one)
  end

  test "visiting the index" do
    visit dangerous_spots_url
    assert_selector "h1", text: "Dangerous Spots"
  end

  test "creating a Dangerous spot" do
    visit dangerous_spots_url
    click_on "New Dangerous Spot"

    fill_in "Address", with: @dangerous_spot.address
    fill_in "Content", with: @dangerous_spot.content
    fill_in "Image", with: @dangerous_spot.image
    fill_in "Latitude", with: @dangerous_spot.latitude
    fill_in "Longitude", with: @dangerous_spot.longitude
    click_on "Create Dangerous spot"

    assert_text "Dangerous spot was successfully created"
    click_on "Back"
  end

  test "updating a Dangerous spot" do
    visit dangerous_spots_url
    click_on "Edit", match: :first

    fill_in "Address", with: @dangerous_spot.address
    fill_in "Content", with: @dangerous_spot.content
    fill_in "Image", with: @dangerous_spot.image
    fill_in "Latitude", with: @dangerous_spot.latitude
    fill_in "Longitude", with: @dangerous_spot.longitude
    click_on "Update Dangerous spot"

    assert_text "Dangerous spot was successfully updated"
    click_on "Back"
  end

  test "destroying a Dangerous spot" do
    visit dangerous_spots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dangerous spot was successfully destroyed"
  end
end
