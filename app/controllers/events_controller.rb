class EventsController < ApplicationController


  # include PgSearch::Model
  # pg_search_scope :search_by_title_and_category,
  #   against: [ :title, :category ],
  #   using: {
  #     tsearch: { prefix: true }


  def filter
    @my_events = current_user.events
    @joined_events = current_user.joined_events
    @all_events = @my_events + @joined_events
  end

  def index

    @participation = Participation.new
    @events = Event.all

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end

  end

  def show
    @event = Event.find(params[:id])
    @participation = Participation.new

    @address = @event.address
    @events = Event.near(@address, 3)
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: 'create_event'
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @event = Event.find(params[:id])
    @event.user = @user
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to @event, notice: 'update_event'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to @event, notice: 'destroy_event'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :category, :neighbourhood, :start_time, :photo)
  end
end
