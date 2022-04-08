require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @password = 'Password1'
    visit restaurants_url
    click_on "Login", match: :first
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @password
    click_on "Log in", match: :first
    assert_text "Signed in successfully."
    @restaurant = restaurants(:one)
  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "h1", text: "Split the Check 🧾"
  end

  test "creating a Restaurant" do
    visit restaurants_url
    click_on "Add Restaurant"

    fill_in "restaurant[name]", with: @restaurant.name
    fill_in "restaurant[location]", with: @restaurant.location

    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant" do
    visit restaurants_url
    click_on "Edit", match: :first

    fill_in "restaurant[name]", with: @restaurant.name
    fill_in "restaurant[location]", with: @restaurant.location

    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    click_on "Back"
  end

  test "searching for restaurant named Good Eats BBQ" do
    visit restaurants_url
    fill_in "q[name_or_location_cont]", with: "Good Eats BBQ"
    click_on "Search", match: :first

    assert_text "1 Result Found"
    assert_text "Good eats BBQ"
    click_on "Split the Check 🧾"
  end

  test "searching for restaurants in GA" do
    visit restaurants_url
    fill_in "q[name_or_location_cont]", with: "GA"
    click_on "Search", match: :first

    assert_text "2 Results Found"
    assert_text "Good eats BBQ"
    assert_text "Dave's"
    click_on "Split the Check 🧾"
  end
end
