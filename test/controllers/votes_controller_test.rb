require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

  setup do
    @vote = votes(:one)
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      sign_in @vote.user
      post votes_url, params: { vote:
        { restaurant_id: @vote.restaurant.id,
        splits_check: @vote.splits_check } }
    end

    assert_redirected_to restaurant_url(@vote.restaurant)
  end
end
