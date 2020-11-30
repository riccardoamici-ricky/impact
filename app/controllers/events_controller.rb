class EventsController < ApplicationController

  # include PgSearch::Model
  # pg_search_scope :search_by_title_and_category,
  #   against: [ :title, :category ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
  def my_events
    @events = current_user.events
  end

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR category ILIKE :query"
        @events = Event.where(sql_query, query: "%#{params[:query]}%")
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
    @participation = Participation.new
  end

  def new
    @event = Event.new
  end

  def create
    # @user = current_user
    # @event.user = @user
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

