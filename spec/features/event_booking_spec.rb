require "rails_helper"

RSpec.describe "Event booking", type: :feature do
  scenario "authenticated user books an event" do
    owner = User.create!(
      email_address: "owner@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    attendee = User.create!(
      email_address: "attendee@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    event = Event.create!(
      title: "Rails Conference",
      description: "Rails event",
      date: 1.week.from_now,
      location: "Beirut",
      capacity: 100,
      user: owner
    )

    visit new_session_path

    fill_in "Enter your email address", with: attendee.email_address
    fill_in "Enter your password", with: "password123"
    click_button "Sign in"

    visit event_path(event)

    click_button "Book Event"

    expect(page).to have_content("Event booked successfully.")
    expect(Order.exists?(user: attendee, event: event)).to be true
  end
end
