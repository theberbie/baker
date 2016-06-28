class ApplicationController < ActionController::Base
before_filter :configure_permitted_parameters, if: :devise_controller?


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   helper_method  :current_customer, :current_artisan,
                :require_customer!, :require_artisan!

  def account_url
    return new_user_session_url unless user_signed_in?
    case current_user.class.name
    when "Artisan"
      artisan_root_url
    when "Customer"
      carrier_root_url
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

    def configure_permitted_parameters
    added_attrs = [:username,:date_of_birth, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end

end




