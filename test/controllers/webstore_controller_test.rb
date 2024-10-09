require "test_helper"

class WebstoreControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get webstore_show_url
    assert_response :success
  end
end
