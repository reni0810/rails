class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || restaurants_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:mobile_no])
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :mobile_no, :address, :email, :password, :current_password )}
  end
end
