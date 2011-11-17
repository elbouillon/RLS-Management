class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :address, :zip, :city, :mobile, :phone, :birthday

  def fullname
    "#{firstname} #{lastname}"
  end

  def fulladdress
    "#{address}, #{zip} #{city}"
  end


  def complete?
    base = [:firstname, :lastname, :address, :zip, :city, :birthday].all? {|i| send(i).present? }
    base2 = [:phone, :mobile].any? { |i| send(i).present? }

    [base, base2].all?
  end

end


ActiveAdmin.register User do
  menu :if => proc{ can?(:manage, User) }
  controller.authorize_resource
end

