class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :name, :email, :password, :password_confirmation, :type
    

end