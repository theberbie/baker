class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.type == :artisan
      redirect_to new_artisan_product_path
      
    end
  end
end
