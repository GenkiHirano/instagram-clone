require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
   get root_path
   assert_template 'pages/top'
   assert_select "a[href=?]", root_path, count: 2
   assert_select "a[href=?]", notification_path
   assert_select "a[href=?]", post_path
 end
end
