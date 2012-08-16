require 'spec_helper'

describe User do
  it "should email welcome message after create" do
  	user = FactoryGirl.create(:user)

  	ActionMailer::Base.deliveries.last.should deliver_to(user.email)
  	ActionMailer::Base.deliveries.last.should have_subject("Welcome blogger!")
  end
end
