require 'rails_helper'

RSpec.describe Like, type: :model do
	before do
	  @user = FactoryGirl.create(:user,email: 'aaass@aaa.com')
	  @post = FactoryGirl.create(:post, user_id: @user.id)
	  @like = Like.create(likeable_id: @post.id, likeable_type: 'Post',user_id: @user.id)
	end
  	it "creates like for post" do

  	expect(@like).to be_valid

  end
end
