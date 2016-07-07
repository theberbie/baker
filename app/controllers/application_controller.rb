class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery


  protected

   def configure_permitted_parameters
    #registration_params = [:email, :password, :password_confirmation, :name, :type]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :type, :date_of_birth, :phone_number, :username) }
  end

end


  
