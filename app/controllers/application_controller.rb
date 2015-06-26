class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  def home
    redirect_to meetings_path if user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :phone_number
    devise_parameter_sanitizer.for(:sign_up) << :sign_up_password
    devise_parameter_sanitizer.for(:account_update) << :name
        devise_parameter_sanitizer.for(:account_update) << :phone_number
  end

  def admin_only!
    if current_user && current_user.admin == true
      true
    else
      redirect_to root_path
    end
  end
end
