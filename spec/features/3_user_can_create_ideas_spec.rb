require "rails_helper"

describe "User creates idea", :type => :feature do
  scenario "User creates idea and sees it on their index" do
    User.create(username: "adam", password: "pass")

    visit login_path
    fill_in "Username", with: "adam"
    fill_in "Password", with: "pass"
    click_button "Login"
    click_link "New Idea"

    fill_in "Title", with: "Random Idea"
    fill_in "Body", with: "My Random Idea"
    click_button "Create Idea"

    expect(page).to have_content("Welcome, adam!")
    expect(page).to have_content("Random Idea")

  end
end
