require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should cast upvote to will_split rating" do
    assert_difference('@restaurant.will_split') do
      @restaurant.will_split_upvote
    end
  end

  test "should cast upvote to wont_split rating" do
    assert_difference('@restaurant.wont_split') do
      @restaurant.wont_split_upvote
    end
  end
end
