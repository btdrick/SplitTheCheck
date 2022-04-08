require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @password = 'Password1'
    visit restaurants_url
    #Login
    click_on "Login", match: :first
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @password
    click_on "Log in", match: :first
    assert_text "Signed in successfully."
  end

  test "logging out" do
    click_on "Logout", match: :first
    assert_text "Signed out successfully."
  end

  test "register new account" do
    click_on "Logout", match: :first
    click_on "Register", match: :first
    fill_in "user[email]", with: 'test@gmail.com'
    fill_in "user[password]", with: @password
    fill_in "user[password_confirmation]", with: @password
    click_on "Sign up", match: :first
    assert_text "Welcome! You have signed up successfully."
  end

  test "update email" do
    click_on "Profile", match: :first
    fill_in "user[email]", with: 'test@gmail.com'
    fill_in "user[current_password]", with: @password
    click_button "Update"
    assert_text "Your account has been updated successfully."
  end

  test "update password" do
    click_on "Profile", match: :first
    fill_in "user[password]", with: 'Password3'
    fill_in "user[password_confirmation]", with: 'Password3'
    fill_in "user[current_password]", with: @password
    click_button "Update"
    assert_text "Your account has been updated successfully."
  end
end
