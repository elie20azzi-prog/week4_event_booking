require "rails_helper"

RSpec.describe "Event search", type: :feature do
  scenario "user searches for an event" do
    user = User.create!(
      email: "search@example.com",
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

    visit new_user_session_path

    fill_in "Email", with: "search@example.com"
    fill_in "Password", with: "password123"
    click_button "Log in"

    visit events_path

    fill_in "Search events", with: "Batroun"
    click_button "Search"

    expect(page).to have_content("Batroun Festival")
  end
end
