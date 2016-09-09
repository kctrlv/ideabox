require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "dave", password: "pass")

    visit login_path
    fill_in "Username", with: "dave"
    fill_in "Password", with: "pass"
    click_button "Login"

    assert page.has_content?("Welcome, dave!")
  end
end
