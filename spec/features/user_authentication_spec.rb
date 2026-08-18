require "rails_helper"

RSpec.describe "User authentication", type: :feature do
  scenario "user signs up and logs in" do
    visit new_registration_path

    fill_in "Email address", with: "feature@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"

    click_button "Create account"

    expect(page).to have_current_path(new_session_path)

    fill_in "Enter your email address", with: "feature@example.com"
    fill_in "Enter your password", with: "password123"

    click_button "Sign in"

    expect(page).to have_current_path(root_path)
  end
end
