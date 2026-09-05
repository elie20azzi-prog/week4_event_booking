module OwnerAuthorizable
  extend ActiveSupport::Concern

  private

  def authorize_owner!
    return if @event.user == Current.user

    redirect_to events_path, alert: "You are not authorized to modify this event."
  end
end