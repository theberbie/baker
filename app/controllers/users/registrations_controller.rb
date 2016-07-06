class Users::RegistrationsController < Devise::RegistrationsController

def new
	super
end

def create
	@user = User.new(params[:user])
flash[:notice]= "yay"
redirect_to new_artisan_product_path
render :action => :new
end

def resource_params
  params.require(resource_name).permit(:email, :password, :password_confirmation)
end

 

  private :resource_params
  

 
  end
end
