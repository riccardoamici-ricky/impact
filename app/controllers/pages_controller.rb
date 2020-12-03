class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
  end

  def rating
  end

  def choose_type_of_post
    @post = Post.new
  end

  def dashboard_admin
    @event = Event.find(params[:event])
    redirect_to root_path, notice: "You are not allowed to access this page" unless current_user.events.includes(@event)
  end
end
