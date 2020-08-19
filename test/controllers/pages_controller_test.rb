require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get top" do
    get pages_top_url
    assert_response :success
    assert_select "title", "Instagram"
  end

  test "should get notification" do
      get pages_notification_url
      assert_response :success
      assert_select "title", "Notification | Instagram"
  end

  test "should get post" do
      get pages_post_url
      assert_response :success
      assert_select "title", "Post | Instagram"
  end

  test "should get my_page" do
      get pages_my_page_url
      assert_response :success
      assert_select "title", "My_page | Instagram"
  end

end
