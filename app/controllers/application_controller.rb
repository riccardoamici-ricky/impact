class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  

  before_action :configure_permitted_parameters, if: :devise_controller?
  def default_url_options
    { host: ENV["www.makeyourimpact.today"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end







end
