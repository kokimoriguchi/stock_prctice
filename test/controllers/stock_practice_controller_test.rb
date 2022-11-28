require "test_helper"

class StockPracticeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get stock_practice_home_url
    assert_response :success
  end
end
