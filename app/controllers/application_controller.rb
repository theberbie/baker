class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :account_url

 def account_url
    return new_user_session_url unless user_signed_in?
    case current_user.class.name
    when "Artisan"
      new_artisan_registration
    when "Customer"
      new_customer_registration_url
    else
      root_url
    end if user_signed_in?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || account_url
  end

  private

   

    def current_customer
      @current_customer ||= current_user if user_signed_in? and current_user.class.name == "Customer"
    end

    def current_artisan
      @artisan_artisan ||= current_user if user_signed_in? and current_user.class.name == "Artisan"
    end

    def customer_logged_in?
      @Customer_logged_in ||= user_signed_in? and current_customer
    end

    def artisan_logged_in?
      @sartisan_logged_in ||= user_signed_in? and current_artisan
    end

    
    def require_customer
      require_user_type(:customer)
    end

    def require_artisan
      require_user_type(:artisan)
    end

    def require_user_type(user_type)
      if (user_type == :artisan and !artisan_logged_in?)  or
        (user_type == :customer and !customer_logged_in?)
        redirect_to root_path, status: 301, notice: "You must be logged in a#{'n' if user_type == :admin} #{user_type} to access this content"
        return false
      end
    end
 protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_in)        << :username
   devise_parameter_sanitizer.for(:sign_up)        << :username
   devise_parameter_sanitizer.for(:account_update) << :username
end


end


  
