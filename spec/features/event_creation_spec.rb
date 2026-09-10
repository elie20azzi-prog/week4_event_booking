require "rails_helper"

RSpec.describe "Event creation", type: :feature do
  scenario "authenticated user creates an event" do
    user = User.create!(
      email: "creator@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"
    click_button "Log in"

    visit new_event_path

    fill_in "Title", with: "Rails Workshop"
    fill_in "Description", with: "A Rails event"
    fill_in "Location", with: "Beirut"
    fill_in "Capacity", with: 100

    click_button "Create Event"

    expect(page).to have_content("Rails Workshop")
  end
end
