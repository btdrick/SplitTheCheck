require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

  setup do
    @favorite = favorites(:one)
    @restaurant = restaurants(:one)
    sign_in @favorite.user
  end

  test "should create favorite" do
    assert_difference('Favorite.count') do
      post favorites_url, params: { favorite:
        { restaurant_id: @restaurant.id } }
    end

    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy favorite" do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(@favorite)
    end

    assert_redirected_to restaurant_url(@favorite.restaurant)
  end

end
