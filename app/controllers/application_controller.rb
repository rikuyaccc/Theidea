class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:image_name,:profile])
  end

  def after_sign_in_path_for(resource)
    posts_path
  end

end
