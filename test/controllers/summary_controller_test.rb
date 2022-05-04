require "test_helper"

class SummaryControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get user_summary_url
    assert_response :success
  end
end
