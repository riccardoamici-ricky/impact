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
    @events = policy_scope(Event).where(user: current_user)
  end

  def index
    @participation = Participation.new
    @events = policy_scope(Event)
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
    @participation = @event.participations.find_by(user_id: current_user.id) if @event.participations.find_by(user_id: current_user.id).present?
    authorize @event
    @address = @event.address
    @events = Event.near(@address, 1)
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
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
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
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    @event.update(event_params)
    redirect_to @event, notice: 'update_event'
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to @event, notice: 'destroy_event'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :category, :neighbourhood, :start_time, :photo)
  end
end
