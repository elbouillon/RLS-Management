ActiveAdmin.register User do

  index do
    column :firstname
    column :lastname
    column :email
    column :address
    column :zip
    column :city
    column :phone
    column :mobile
    column :birthday
    column "fsih", :fsih_license_number
    column "last sign in" do |user|
      l(user.last_sign_in_at, :format => :short)
    end
    default_actions
  end

  filter :firstname
  filter :lastname
  filter :email
  filter :address
  filter :zip
  filter :city
  filter :phone
  filter :mobile
  filter :birthday
  filter :fsih_license_number, :label => "fsih"
  filter :last_sign_in_at

end
