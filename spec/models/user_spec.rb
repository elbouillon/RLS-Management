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
end
