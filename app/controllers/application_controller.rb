class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!, except: [:index, :show]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :send_newsletter])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :send_newsletter])
  end

end
