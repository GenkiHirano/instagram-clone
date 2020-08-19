require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Instagram"
  end

  test "should get top" do
    get pages_top_url
    assert_response :success
    assert_select "title", "Top | #{@base_title}"
  end

  test "should get notification" do
      get pages_notification_url
      assert_response :success
      assert_select "title", "Notification | #{@base_title}"
  end

  test "should get post" do
      get pages_post_url
      assert_response :success
      assert_select "title", "Post | #{@base_title}"
  end

  test "should get my_page" do
      get pages_my_page_url
      assert_response :success
      assert_select "title", "My_page | #{@base_title}"
  end

end
