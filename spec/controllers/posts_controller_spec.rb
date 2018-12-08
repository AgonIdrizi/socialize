require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "index" do
  	context "without sign in" do
  	  it "shouldnt respond succesfully" do
  	    get :index
  	    expect(response).to_not be_successful
  	  end

  	  it "returns a 302 response" do
  	  	get :index
  	  	expect(response).to have_http_status "302"
  	  end

  	  it "redirects to sign-up page" do
  	  	get :index
  	  	expect(response).to redirect_to "/users/sign_in"
  	  end
  	end

  	context "with sign-in the user first" do
  	  before do
  	    @user = FactoryGirl.create(:user)
  	  end
  	  it "should respond succesfully" do
  	  	sign_in @user
  	  	get :index
  	    expect(response).to be_successful
  	  end
  	  it "returns a 200 response" do
  	  	sign_in @user
  	  	get :index
  	  	expect(response).to have_http_status "200"
  	  end
  	end
  end

  describe "#show" do
  	before do
  	  @user = FactoryGirl.create(:user)
  	  @post = @user.posts.create(body: "hey hey")
  	end
  	context "without sign in" do

  	  it "doesnt respond succesfully" do
  	  	get :show, params: {id: @post.id}
  	  	expect(response).to_not be_successful
  	  end

  	  it "responds a 302 code" do
  	  	get :show, params: {id: @post.id}
  	  	expect(response).to have_http_status "302"
  	  end
  	end
  	context "with signed user" do
  	  it "should respond succesfully" do
  	  	sign_in @user
  	  	get :show, params: {id: @post.id}
  	  	expect(response).to be_successful
  	  end
  	end
  end

  describe "#create" do
  	before do
  	  @user = FactoryGirl.create(:user)
  	end
  	context "without sign in the user" do
  	  it "shouldnt be succesfull" do
  	  post :create, params: {
  	  				  		body: "hey hsss"
  	 				}
  	  expect(response).to_not be_successful
  	  end

  	  it "should redirect to sign-in page" do
  	  post :create, params: {
  	  				  		body: "hey hsss"
  	 				}
  	  expect(response).to redirect_to "/users/sign_in"
  	  end

  	end
  	context "with sign-in the user" do
  	  it "should be succesfull" do
  	    sign_in @user
  	    post_params = FactoryGirl.attributes_for(:post,
  	    										image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/kittens.jpg'))))
  	    expect {
  	      post :create, params: {post: post_params
  	 				  }
  	    }.to change(@user.posts, :count).by(1)
  	    expect(@user.posts.last.image).to_not be_blank
  	  end

      it "should be succesfull without image" do
        sign_in @user
        post_params = FactoryGirl.attributes_for(:post,
                            image: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/kittens.jpg'))))
        expect {
          post :create, params: {post: post_params
              }
        }.to change(@user.posts, :count).by(1)
        
      end
  	end
  end

end
