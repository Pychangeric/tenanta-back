require "test_helper"

class Leaders::ResidencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leaders_residences_index_url
    assert_response :success
  end

  test "should get show" do
    get leaders_residences_show_url
    assert_response :success
  end

  test "should get new" do
    get leaders_residences_new_url
    assert_response :success
  end

  test "should get edit" do
    get leaders_residences_edit_url
    assert_response :success
  end
end
