require "rails_helper"

RSpec.describe "User authentication", type: :feature do
  scenario "user signs up and logs in" do
    visit new_user_registration_path

    fill_in "Email", with: "feature@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"

    click_button "Sign up"

    expect(page).to have_current_path(root_path)

    click_button "Log out"

    visit new_user_session_path

    fill_in "Email", with: "feature@example.com"
    fill_in "Password", with: "password123"

    click_button "Log in"

    expect(page).to have_current_path(root_path)
  end
end
