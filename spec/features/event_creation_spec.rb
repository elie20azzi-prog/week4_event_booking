require "rails_helper"

RSpec.describe "Event creation", type: :feature do
  scenario "authenticated user creates an event" do
    user = User.create!(
      email_address: "creator@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    visit new_session_path

    fill_in "Enter your email address", with: user.email_address
    fill_in "Enter your password", with: "password123"

    click_button "Sign in"

    visit new_event_path

    fill_in "Title", with: "Rails Workshop"
    fill_in "Description", with: "A Rails event"
    fill_in "Location", with: "Beirut"
    fill_in "Capacity", with: 100

    click_button "Create Event"

    expect(page).to have_content("Rails Workshop")
  end
end
