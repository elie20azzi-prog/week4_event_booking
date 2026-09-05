class BookingNotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    BookingMailer.confirmation(order).deliver_now
  end
end
