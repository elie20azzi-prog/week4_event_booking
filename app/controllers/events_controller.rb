class EventsController < ApplicationController
  include OwnerAuthorizable

  before_action :set_event, only: %i[show edit update destroy]
  before_action :authorize_owner!, only: %i[edit update destroy]

  def index
    events = Event.all

    if params[:query].present?
      events = events.where("title ILIKE ?", "%#{params[:query]}%")
    end

    @pagy, @events = pagy(:offset, events.order(:id), limit: 5)
  end

  def show
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @event = Current.user.events.build(event_params)
    @categories = Category.all

    if @event.save
      redirect_to @event, notice: "Event created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    @categories = Category.all

    if @event.update(event_params)
      redirect_to @event, notice: "Event updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted successfully."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end


  def event_params
  params.expect(
    event: [
      :title,
      :description,
      :date,
      :location,
      :capacity,
      :category_id,
      :image
    ]
  )
end
end
