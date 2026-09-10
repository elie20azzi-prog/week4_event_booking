class BookingMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    @user = order.user
    @event = order.event

    mail(
      to: @user.email,
      subject: "Booking confirmed for #{@event.title}"
    )
  end
end
