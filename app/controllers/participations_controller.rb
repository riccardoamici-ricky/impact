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
      redirect_to events_path, alert: "You already joined this event"
    end
   end

  def destroy
    @participation = Participation.find(params[:id])
    if current_user.participations.includes(@participation)
      @participation.destroy

    redirect_to @participation.event, notice: 'destroy_participation'
    end
  end
end
