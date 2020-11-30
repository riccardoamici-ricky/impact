class ParticipationsController < ApplicationController

  def create

    @participation = Participation.new
    @participation.user = current_user
    @event = Event.find(params[:event_id])
    @participation.event = @event

    if @participation.save
      redirect_to @event
    else
      render :new
    end
   end
end
