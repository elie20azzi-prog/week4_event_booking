require "rails_helper"

RSpec.describe "Event search", type: :feature do
  scenario "user searches for an event" do
    user = User.create!(
      email_address: "search@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    Event.create!(
      title: "Batroun Festival",
      description: "Food and live show",
      date: 1.week.from_now,
      location: "Batroun",
      capacity: 500,
      user: user
    )

    visit new_session_path

    fill_in "Enter your email address", with: "search@example.com"
    fill_in "Enter your password", with: "password123"
    click_button "Sign in"

    visit events_path

    fill_in "Search events", with: "Batroun"
    click_button "Search"

    expect(page).to have_content("Batroun Festival")
  end
end