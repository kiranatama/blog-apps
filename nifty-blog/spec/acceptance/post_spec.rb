require 'acceptance/acceptance_helper'

feature 'Post' do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.build(:post) }
  
  before(:each) { log_in(user.email, user.password) }

  scenario 'Creating a post' do
    visit(new_post_path)
    fill_in('Title', :with => post.title)
    fill_in('Body', :with => post.body)
    click_button('Create Post')
    
    page.should have_content(post.title)
  end

  scenario 'Editing a post' do
    post.save
    new_title = 'The world has changed'

    visit(posts_path)
    click_link(post.title)
    click_link('Edit')
    fill_in('Title', :with => new_title)
    click_button('Update Post')
    
    page.should have_content(new_title)
    page.should have_no_content(post.title)
  end
  
  scenario 'Deleting a post' do
    post.save
    
    visit(posts_path)
    click_link(post.title)
    click_link('Destroy')
    
    page.should have_content('Successfully destroyed post.')
    page.should have_no_content(post.title)
  end
  
  scenario 'Listing posts' do
    post.save
    visit(posts_path)
    
    page.should have_content(post.title)
  end
end
