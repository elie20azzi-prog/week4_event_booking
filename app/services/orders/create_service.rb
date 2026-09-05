module Orders
  class CreateService
    def initialize(user:, event:)
      @user = user
      @event = event
    end

    def call
      order = @user.orders.build(
        event: @event,
        status: "confirmed"
      )

      return order unless order.save

      order.create_ticket!(
        ticket_number: "TICKET-#{order.id}",
        status: "active"
      )

      BookingNotificationJob.perform_later(order.id)

      order
    end
  end
end