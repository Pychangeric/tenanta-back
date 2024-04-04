require "test_helper"

class Admins::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_profiles_show_url
    assert_response :success
  end
end
