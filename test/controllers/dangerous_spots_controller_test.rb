require "test_helper"

class DangerousSpotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dangerous_spot = dangerous_spots(:one)
  end

  test "should get index" do
    get dangerous_spots_url
    assert_response :success
  end

  test "should get new" do
    get new_dangerous_spot_url
    assert_response :success
  end

  test "should create dangerous_spot" do
    assert_difference('DangerousSpot.count') do
      post dangerous_spots_url, params: { dangerous_spot: { address: @dangerous_spot.address, content: @dangerous_spot.content, image: @dangerous_spot.image, latitude: @dangerous_spot.latitude, longitude: @dangerous_spot.longitude } }
    end

    assert_redirected_to dangerous_spot_url(DangerousSpot.last)
  end

  test "should show dangerous_spot" do
    get dangerous_spot_url(@dangerous_spot)
    assert_response :success
  end

  test "should get edit" do
    get edit_dangerous_spot_url(@dangerous_spot)
    assert_response :success
  end

  test "should update dangerous_spot" do
    patch dangerous_spot_url(@dangerous_spot), params: { dangerous_spot: { address: @dangerous_spot.address, content: @dangerous_spot.content, image: @dangerous_spot.image, latitude: @dangerous_spot.latitude, longitude: @dangerous_spot.longitude } }
    assert_redirected_to dangerous_spot_url(@dangerous_spot)
  end

  test "should destroy dangerous_spot" do
    assert_difference('DangerousSpot.count', -1) do
      delete dangerous_spot_url(@dangerous_spot)
    end

    assert_redirected_to dangerous_spots_url
  end
end
