require 'spec_helper'

describe 'The homepage', :vcr do
  it 'displays recent headlines from ESPN' do
    visit '/'
    headlines_links = all '#headlines .item a'
    headlines_links.should_not be_empty
    headlines_links.each do |link|
      link[:href].should match("espn.go.com")
    end
  end
end