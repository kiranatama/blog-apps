require "spec_helper"

describe UserMailer do
  let(:user) { FactoryGirl.create(:user) }

  it "send welcome message" do
  	email = UserMailer.welcome_email(user)

  	email.should deliver_to(user.email)
  	email.should have_subject("Welcome blogger!")
  end
end
