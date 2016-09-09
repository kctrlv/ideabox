require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "visitor can create user account" do
    visit new_user_path
    fill_in "Username", with: "davidos"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, davidos!")
  end
end
