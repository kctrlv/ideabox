require "rails_helper"

describe "User logs in", :type => :feature do
  scenario "User logs in and sees their Ideas Index" do
    User.create(username: "adam", password: "pass")

    visit login_path
    fill_in "Username", with: "adam"
    fill_in "Password", with: "pass"
    click_button "Login"

    expect(page).to have_content("Welcome, adam!")
    expect(page).to have_content("Your Ideas: ")
  end
end
