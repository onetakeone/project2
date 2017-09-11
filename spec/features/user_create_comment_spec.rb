require "rails_helper"
include Warden::Test::Helpers

feature "access check content create" do
  
  scenario "access and check" do
    #login via Warden helper login_as
    visit '/users/sign_in/'  
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/places/'  
    #Internalisation check
    expect(page).to have_content I18n.t('places.places')   
  end 

  scenario "create" do
    visit '/users/sign_in/'  
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user, :run_callbacks => false)
 
    visit '/places/new'  
      fill_in 'Title', with: 'Title-test'
      fill_in 'Description', with: 'Description-test'
      fill_in 'Address', with: 'Address-test'
      fill_in 'Tags', with: 'Tags'
      click_button 'Settle place'
      expect(page).to have_content 'created'  
  end 
    
end