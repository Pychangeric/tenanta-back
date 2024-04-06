require "test_helper"

class Leaders::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leaders_dashboard_index_url
    assert_response :success
  end
end
