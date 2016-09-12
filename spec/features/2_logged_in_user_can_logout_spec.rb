require "rails_helper"

describe "User logs out", :type => :feature do
  scenario "User logs out and their session is cleared" do
    User.create(username: "adam", password: "pass")

    visit login_path
    fill_in "Username", with: "adam"
    fill_in "Password", with: "pass"
    click_button "Login"
    click_link "Logout"

    expect(page).not_to have_content("Welcome, adam!")
  end
end
