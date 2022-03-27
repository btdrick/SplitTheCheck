require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant:
        { location: @restaurant.location, name: @restaurant.name,
          will_split: @restaurant.will_split,
          wont_split: @restaurant.wont_split } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant:
      { location: @restaurant.location, name: @restaurant.name,
        will_split: @restaurant.will_split,
        wont_split: @restaurant.wont_split } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end

  test "should search for restaurants in GA" do
    get restaurants_url
    assert_difference('Restaurant.count', -2) do
      get restaurants_url, params: { q: { name_or_location_cont: "GA" } }
    end
  end

  test "should cast vote that restaurant splits checks" do
    assert_difference('@restaurant.will_split') do
      put '/restaurant/' + @restaurant.id.to_s + '/vote',
      params: { will: 'VOTE', id: @restaurant }
    end
  end

  test "should cast vote that restaurant doesn't split checks" do
    assert_difference('@restaurant.wont_split') do
      post
    end
  end
end
