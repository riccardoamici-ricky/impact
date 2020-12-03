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

  def check_in
    @participation = Participation.find(params[:participation_id])
    @user = @participation.user
    @participation.checked_in = !@participation.checked_in
    @participation.save
    if @participation.checked_in
      @user.karma_points += 10
      redirect_to dashboard_admin_path(event: @participation.event), alert: "User now checked in"
    else
      @user.karma_points -= 10
      redirect_to dashboard_admin_path(event: @participation.event), alert: "User not checked in"
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
