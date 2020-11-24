class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    # @user = current_user
    # @event.user = @user
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Your event is online!'
    else
      render :new
    end
  end

  def edit
    #@user = current_user
    @event = Event.find(params[:id])
    #@event.user = @user
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to root_path, notice: 'Your event has been updated'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path, notice: 'You have deleted your event'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :category, :neighbourhood, :start_date, photos: [])
  end

end

