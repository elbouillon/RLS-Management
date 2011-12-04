class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname, :address, :zip, :city, :mobile, :phone, :birthday, :fsih_license_number, :admin
  attr_accessible :avatar, :avatar_cache, :remove_avatar

  # avatar
  mount_uploader :avatar, AvatarUploader
  # validation

  # callbacks
  after_initialize :format_name

  def fullname
    "#{firstname} #{lastname}"
  end
  alias :to_s :fullname

  def fulladdress
    "#{address}, #{zip} #{city}"
  end


  def complete?
    base = [:firstname, :lastname, :address, :zip, :city, :birthday].all? {|i| send(i).present? }
    base2 = [:phone, :mobile].any? { |i| send(i).present? }

    [base, base2].all?
  end

  def set_coords(vcard)
      self.address, self.zip, self.city = vcard.address.street, vcard.address.postalcode, vcard.address.locality if vcard.address
  end

  def set_email(vcard)
    self.email = vcard.email ? vcard.email.to_s : "#{firstname}#{lastname}@novalidemailwhenimporting.com"
  end


  def self.import_from_vcard(vcard)
    users = []

    vcard.each do |v|
      user = self.find_or_initialize_by_firstname_and_lastname(v.name.given, v.name.family)
      user.set_email(v)
      user.set_coords(v)
      user.password = "rlsnew1234" unless user.password
      user.phone, user.mobile = v.telephone("HOME").to_s, v.telephone("CELL").to_s
      user.birthday = v.birthday

      user.save

      users << user
    end

    if users.count == 1
      users.first
    else
      users
    end
 end

  private

  def format_name
    lastname.try(:capitalize!)
    self.lastname = lastname.try(:strip)
  end
end
