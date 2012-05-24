require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }

  it "should require confirmation of password" do
    subject.password = "secret"
    should have(1).error_on(:password)
  end
end
