require 'spec_helper'

describe User do
  let(:u) { FactoryGirl.build(:user) }

  it "should be valid" do
    u.should be_valid
  end

  it "should give is completness back" do
    u.should be_complete
    u.mobile, u.phone = nil, nil
    u.should_not be_complete
  end

  it "should import a contact from vcard" do
    vcard = Vpim::Vcard.decode(File.open('spec/fixtures/contact.vcf'))
    user = User.import_from_vcard(vcard)
    user.should be_an_instance_of User

    user.should be_valid

    user.lastname.should == "Abegglen"
    user.fullname.should == "David Abegglen"
  end

   describe "internal building" do
      let(:u) {User.new}
      let(:v) {Vpim::Vcard.decode(File.open('spec/fixtures/contacts.vcf')).first}

      it "should set email depending on avaible data" do
        u.set_email(v).should == v.email.to_s
        # v.email = nil
        # u.set_email(v).should == "#{u.firstname}#{u.lastname}@novalidemailwhenimporting.com"
      end

      it "should set coords" do
        u.set_coords(v).should == [ v.address.street, v.address.postalcode, v.address.locality ]
      end
    end


  describe "should import contacts from vcard containing multiple cards" do

    before(:all) do
      @vcards = Vpim::Vcard.decode(File.open('spec/fixtures/contacts.vcf'))
      @users = User.import_from_vcard(@vcards)
    end

    it "should use an array" do
      @users.should be_an_instance_of Array
      @users.count.should == 100
    end

    it "should instanciate every user" do
      user = @users.first
      user.should be_an_instance_of User
      user.lastname.should == "Pittet"
      user.fullname.should == "Alain Pittet"
      user.phone.should == "021 625 00 00"
      user.mobile.should == "079 400 53 21"
      user.birthday.should.to_s == "1981-05-17"
    end

    it "should be save all together" do
      User.all.count.should == 100
    end
  end
  
end
