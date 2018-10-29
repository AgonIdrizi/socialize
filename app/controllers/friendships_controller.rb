class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends.includes(image_attachment: [:blob]).paginate(:page => params[:page], :per_page => 30)
  end
  def new
  	
  end
  def create
    @user = User.find_by(id: params[:user_id])
  	@friendship = Friendship.new(friend_id: current_user.id, user_id: params[:user_id])
  	if @friendship.save
  		respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  	else
  		render 'new'
  	end
  	#debugger
  	
  end

  def destroy
    @user = User.find_by(id: params[:friendship][:user_id])
  	current_user.friends_relationship.find_by(user_id: params[:friendship][:user_id]).destroy
	  respond_to do |format|
	  	format.html {redirect_to root_path}
	  	format.js
	  end
  end
end
