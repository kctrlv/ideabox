require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "logged in user can logout" do
    user = User.create(username: "dave", password: "pass")

    visit login_path
    fill_in "Username", with: "dave"
    fill_in "Password", with: "pass"
    click_button "Login"

    click_link "Logout"
    refute page.has_content?("Signed in as: dave")
  end
end
