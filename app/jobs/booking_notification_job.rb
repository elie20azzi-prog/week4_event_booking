class BookingNotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    puts "Processing booking notification for order ##{order_id}"
  end
end