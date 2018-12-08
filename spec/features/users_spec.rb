require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "users can send friend requests" do
  	user = FactoryGirl.create(:user)
  	@user2 = FactoryGirl.create(:user)

  	visit "/users/sign_in"
  	fill_in "Email", with: user.email
  	fill_in "Password", with: user.password
  	click_button "Log in"
  	visit "/users"
  	
  	expect(page).to have_content "#{@user2.name}"
  	
  	expect{
      find_all("user-form#{@user2.id}")
      find_button("Add Friend").click
    }.to change(@user2.friend_requests_received, :count).by(1)
    
    visit "/users"
    save_and_open_page
   	expect{
      find_all("user-form#{@user2.id}").find("edit_request_#{Request.find_by(sender_id: user.id, accepter_id: @user2.id).id}")
      find('input[name="commit"]').click

    }.to change(@user2.friend_requests_received, :count).by(-1)
  	
  	#expect(page).to have_content "Cancel Request"
  	
  end

  scenario "users can send friend requests with ajax", js: true do
  	user = FactoryGirl.create(:user)
  	@user2 = FactoryGirl.create(:user)

  	visit "/users/sign_in"
  	fill_in "Email", with: user.email
  	fill_in "Password", with: user.password
  	click_button "Log in"
  	visit "/users"
  	
  	expect(page).to have_content "#{@user2.name}"
  	
  	
      find_all("user-form#{@user2.id}")
      find_button("Add Friend").click
    
    expect(page).to have_text "Requested"
    visit "/users"
    
   	save_and_open_page
      find_all("user-form#{@user2.id}").find("edit_request_#{Request.find_by(sender_id: user.id, accepter_id: @user2.id).id}")
      
      find('input[name="commit"]').click
      expect(page).to have_text "Add Friend"
      save_and_open_page
    
  end
end
