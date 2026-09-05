require "rails_helper"

RSpec.describe BookingNotificationJob, type: :job do
  it "calls the booking confirmation mailer for the order" do
    user = User.create!(
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
      user: user
    )

    order = Order.create!(
      user: user,
      event: event,
      status: "confirmed"
    )

    allow(BookingMailer).to receive_message_chain(:confirmation, :deliver_now)

    described_class.perform_now(order.id)

    expect(BookingMailer).to have_received(:confirmation).with(order)
  end
end
