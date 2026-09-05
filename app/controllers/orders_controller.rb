class OrdersController < ApplicationController
  def create
    event = Event.find(params[:event_id])

    order = Orders::CreateService.new(
      user: Current.user,
      event: event
    ).call

    if order.persisted?
      redirect_to event, notice: "Event booked successfully."
    else
      redirect_to event, alert: "Could not book this event."
    end
  end
end