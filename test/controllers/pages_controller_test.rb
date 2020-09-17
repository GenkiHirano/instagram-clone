require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get top" do
    get root_path
    assert_response :success
    assert_select "title", "Instagram"
  end

  test "should get notification" do
      get notification_path
      assert_response :success
      assert_select "title", "Notification | Instagram"
  end

  test "should get post" do
      get post_path
      assert_response :success
      assert_select "title", "Post | Instagram"
  end
end
