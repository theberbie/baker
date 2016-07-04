class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  def create
   super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
   def destroy
       super
   end

  protected

  def resource_params
  params.require(resource_name).permit(:email, :password, :password_confirmation)
end
private :resource_params

def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
    end
end

def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update)do |u|
      u.permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache)
  end
end
end