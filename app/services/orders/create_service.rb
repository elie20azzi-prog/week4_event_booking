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

      order
    end
  end
end