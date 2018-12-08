require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "user can make a post with image" do
  	user = FactoryGirl.create(:user)

  	visit "/users/sign_in"
  	fill_in "Email", with: user.email
  	fill_in "Password", with: user.password
  	click_button "Log in"

  	expect(page).to have_current_path(root_url, url: true)
  	
  	expect {
  	find('textarea[name="post[body]"]').fill_in with: " hey i'm just testing this area"
  	find('input[name="post[image]"]')
  	attach_file('post[image]', File.join(Rails.root, '/spec/support/kittens.jpg'), visible: false)
  	find_button("New Post").click
  }.to change(user.posts, :count).by(1)
  	#save_and_open_page
  end
end
