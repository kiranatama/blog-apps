require 'acceptance/acceptance_helper'

feature 'Authentication' do    
  let :user do
    FactoryGirl.create(:user)
  end

  scenario 'Login required' do    
    visit(root_path)

    current_path.should eq(new_user_session_path)
    page.should have_content('You need to sign in or sign up before continuing.')    
  end
  
  scenario 'Signing in' do
    log_in(user.email, user.password)

    current_path.should eq(root_path)
    page.should have_content('Signed in successfully.')
  end
  
  scenario 'Signing out' do
    log_in(user.email, user.password)
    visit(root_path)
    click_link('Sign out')

    current_path.should eq(new_user_session_path)
  end
end
