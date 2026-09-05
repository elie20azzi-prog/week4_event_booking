module Api
  module V1
    class EventsController < ApplicationController
      def index
        events = Event.includes(:category)

        render json: events.as_json(
          only: %i[id title description date location capacity],
          include: {
            category: {
              only: %i[id name]
            }
          }
        )
      end

      def show
        event = Event.includes(:category).find(params[:id])

        render json: event.as_json(
          only: %i[id title description date location capacity],
          include: {
            category: {
              only: %i[id name]
            }
          }
        )
      end
    end
  end
end
