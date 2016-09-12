require "rails_helper"

describe "Visitor signs up", :type => :feature do
  scenario "Visitor registers and is redirected to his index" do
    visit signup_path
    fill_in "Username", with: "User1"
    fill_in "Password", with: "Pass1"
    fill_in "Confirm Password", with: "Pass1"

    click_button "Create Account"

    expect(page).to have_content("Welcome, User1!")
    expect(page).to have_content("Your Ideas: ")
  end
end
