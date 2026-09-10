require "rails_helper"

RSpec.describe BookingMailer, type: :mailer do
  it "builds a booking confirmation email" do
    user = User.create!(
      email: "attendee@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    event = Event.create!(
      title: "Rails Conference",
      description: "Rails event",
      date: 1.week.from_now,
      location: "Beirut",
      capacity: 100,
      user: user
    )

    order = Order.create!(
      user: user,
      event: event,
      status: "confirmed"
    )

    order.create_ticket!(
      ticket_number: "TICKET-#{order.id}",
      status: "active"
    )

    mail = described_class.confirmation(order)

    expect(mail.to).to eq([ "attendee@example.com" ])
    expect(mail.subject).to eq("Booking confirmed for Rails Conference")
    expect(mail.body.encoded).to include("TICKET-#{order.id}")
  end
end
