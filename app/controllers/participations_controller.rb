class ParticipationsController < ApplicationController

  def my_participations
    @participations = current_user.participations
  end

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
