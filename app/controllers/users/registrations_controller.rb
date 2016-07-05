class Users::RegistrationsController < Devise::RegistrationsController



def resource_params
  params.require(resource_name).permit(:email, :password, :password_confirmation)
end

 

  private :resource_params
  

 
  end
end
