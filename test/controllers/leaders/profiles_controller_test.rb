require "test_helper"

class Leaders::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get leaders_profiles_show_url
    assert_response :success
  end
end
