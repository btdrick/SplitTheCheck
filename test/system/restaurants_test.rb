require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @restaurant = restaurants(:restaurant_1)
  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "h1", text: "Split the Check 🧾"
  end

  test "creating a Restaurant" do
    visit restaurants_url
    click_on "Add Restaurant"

    fill_in "name", with: @restaurant.name
    fill_in "Location", with: @restaurant.location

    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant" do
    visit restaurants_url
    click_on "Edit", match: :first

    fill_in "name", with: @restaurant.name
    fill_in "Location", with: @restaurant.location

    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurant" do
    visit restaurants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurant was successfully destroyed"
  end

  test "voting a restaurant that splits checks" do
    visit restaurants_url
    click_on "Show", match: :first
    click_on "will", match: :first

    assert_text "Will split rating: 1"
    assert_text "Wont split rating: 0"
    click_on "Back"
  end

  test "voting a restaurant that doesn't split checks" do
    visit restaurants_url
    click_on "Show", match: :first
    click_on "wont", match: :first

    assert_text "Will split rating: 0"
    assert_text "Wont split rating: 1"
    click_on "Back"
  end
end
