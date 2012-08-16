class UserMailer < ActionMailer::Base
  default from: "no-reply@example.com"

  def welcome_email(user)
  	@user = user
  	@url = "http://localhost:3000/sign_in"
  	mail(:to => user.email, :subject => "Welcome blogger!")
  end
end
