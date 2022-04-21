require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get will_split rating" do
    assert_equal 1, @restaurant.get_will_split_vote_count
  end

  test "should get wont_split rating" do
    assert_equal 0, @restaurant.get_wont_split_vote_count
  end
end
