class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def ensure_login
    unless user_signed_in?
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end

  def ensure_admin
    unless user_signed_in? && current_user.admin?
      flash[:notice] = "You must be an admin to do that"
      redirect_to dashboard_index_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :admin])
  end
end
