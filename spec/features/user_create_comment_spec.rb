require "rails_helper"
include Warden::Test::Helpers

feature "comment creation" do
  
  scenario "access" do
    visit '/users/sign_in/'  
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/places/'  
    expect(page).to have_content 'Places'    
  end 
  
end