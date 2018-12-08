require 'rails_helper'

RSpec.describe Post, type: :model do
	before do
		@user = FactoryGirl.create(:user,email: "test@test.com")
		
	end
  it "shoul be valid" do
  	post = Post.create(body: 'hey hey hey',user_id: @user.id)
  	expect(post).to be_valid
  end
  it "can have 1 like" do
  	post = Post.create(body: 'hey hey hey',user_id: @user.id)
  	post.likes.create
  	puts "#{post.inspect}"
  	expect(post.likeable_count).to eq 1
  end

  it "should not have duplicate likes"
  #post = FactoryGirl.create(:post, :with_likes)
  #puts "#{post.likes.inspect}"
end
