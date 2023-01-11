require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get followers" do
    get pages_followers_url
    assert_response :success
  end

  test "should get followees" do
    get pages_followees_url
    assert_response :success
  end
end
