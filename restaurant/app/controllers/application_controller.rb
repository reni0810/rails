class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def page_error
		respond_to do |format|
      format.html { render file:'public/404.html', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def internal_error
		respond_to do |format|
      format.html { render file:'public/500.html', status: 500 }
      format.all  { render nothing: true, status: 500 }
    end
  end

  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:mobile_no,:role])
	    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :mobile_no, :email, :password, :current_password, :role )}
	  end

end
