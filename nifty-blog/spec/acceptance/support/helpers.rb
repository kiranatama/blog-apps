module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.

  def log_in(email, password)
    visit('/users/sign_in')
    fill_in('Email', :with => email)
    fill_in('Password', :with => password)
    click_button('Sign in')
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance