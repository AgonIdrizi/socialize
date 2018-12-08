require 'rails_helper'

RSpec.describe Request, type: :model do
	before(:each) do
	@user = FactoryGirl.create(:user, email: 'rrrr@rrr.com')
  	@user2 = FactoryGirl.create(:user,:accepter,email: "eee@eee.com")
  	@request = FactoryGirl.create(:request)
  	
  end

  it "should be valid request" do
    
    expect(@request).to be_valid
  end

  it "should be valid request" do
  	
  	puts "This is request #{@request.inspect}"
  end

  it "should not be valid to send request to yourself" do
  	request = Request.new(sender_id: @user.id, accepter_id: @user.id)
    expect(request.persisted?).to be_falsey
  end

  it "should not be valid if request already exists" do 
  	request_not_valid = Request.new(sender_id: @user.id, accepter_id: @user2.id)
  	expect(request_not_valid.persisted?).to be_falsey
  end
 	
end
