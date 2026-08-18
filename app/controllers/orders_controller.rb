class OrdersController < ApplicationController
  def create
    event = Event.find(params[:event_id])

    order = Current.user.orders.build(
      event: event,
      status: "confirmed"
    )

    if order.save
      redirect_to event, notice: "Event booked successfully."
    else
      redirect_to event, alert: "Could not book this event."
    end
  end
end
