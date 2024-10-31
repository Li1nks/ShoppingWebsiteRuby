require "test_helper"

class WebstoreTabsControllerTest < ActionDispatch::IntegrationTest
  test "should get shopping" do
    get webstore_tabs_shopping_url
    assert_response :success
  end

  test "should get about_us" do
    get webstore_tabs_about_us_url
    assert_response :success
  end

  test "should get location" do
    get webstore_tabs_location_url
    assert_response :success
  end

  test "should get checkout" do
    get webstore_tabs_checkout_url
    assert_response :success
  end
end
