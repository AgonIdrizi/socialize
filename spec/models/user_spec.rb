require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  	@user = FactoryGirl.create(:user,email: 'aaa@aaa.com')
  	
  	#user2 = FactoryGirl.create(:accepter)
  end
  it "should have uniqe email" do
  	user3 = FactoryGirl.build(:user, email: @user.email)
  	user3.valid?
  	expect(user3.errors[:email]).to include("has already been taken")
  end

  it "can have 1 post" do
  	@user.posts.create(body: 'hey hey hey')
  	expect(@user.posts.length).to eq 1
  end

  describe "user should have image" do
  	context "on creating user should have default image" do
  	end
  	context "user should be able to change his image" do
  	end
  end
end
