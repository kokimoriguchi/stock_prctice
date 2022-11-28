require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_index_url
    assert_response :success
  end

  test "should get show" do
    get top_show_url
    assert_response :success
  end

  test "should get new" do
    get top_new_url
    assert_response :success
  end

  test "should get edit" do
    get top_edit_url
    assert_response :success
  end
end
